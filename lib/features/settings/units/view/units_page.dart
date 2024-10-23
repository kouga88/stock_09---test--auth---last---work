import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/bloc/units_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/widgets/units_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/widgets/units_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class UnitsPage extends StatefulWidget {
  const UnitsPage({super.key});

  @override
  State<UnitsPage> createState() => _UnitsPageState();
}

class _UnitsPageState extends State<UnitsPage> {
  final UnitsBloc _unitsBloc = UnitsBloc(
    GetIt.I<UnitsRepo>(),
  );
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _unitsBloc.add(LoadUnitsListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _unitsBloc.add(LoadUnitsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

    // final theme = Theme.of(context);
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      if (!authState.user.is_active) {
        return const Center(
          child: Text("Доступ закрыт"),
        );
      }
    }
    return RefreshIndicator(
      onRefresh: () async {
        return refreshList();
      },
      child: BlocBuilder<UnitsBloc, UnitsState>(
        bloc: _unitsBloc,
        builder: (context, state) {
          if (state is UnitsListLoadedState) {
            final unitsList = state.unitsList!;
            final isEnd = state.isEnd!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (width > 700)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (width > 700)
                                SizedBox(
                                  width: 200,
                                  child: TextField(
                                    onSubmitted: (value) {
                                      refreshList();
                                    },
                                    controller: _textSearchController,
                                    style: const TextStyle(
                                        fontFamily: 'SFProDisplay',
                                        fontSize: 12),
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      // contentPadding: EdgeInsets.all(10),
                                      hintText: 'Поиск',
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    UnitsCreateFromWidget(
                                  bloc: _unitsBloc,
                                ),
                              );
                            },
                            style: buttonsTheme.secondaryButton,
                            icon: const Icon(
                              Symbols.add,
                              color: greyBlue45Color,
                              size: 26,
                            ),
                            tooltip: 'Создать еденицу измерения',
                          ),
                        ],
                      ),
                    UnitsListTableWidget(
                      unitsList: unitsList,
                      unitsBloc: _unitsBloc,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child:
                            Text('${unitsList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _unitsBloc.add(LoadNextUnitsListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is UnitsLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
