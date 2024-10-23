import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/bloc/nomenclatures_parametrs_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_list_table.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_list_table_700.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesParametrsPage extends StatefulWidget {
  const NomenclaturesParametrsPage({super.key});

  @override
  State<NomenclaturesParametrsPage> createState() =>
      _NomenclaturesParametrsPageState();
}

class _NomenclaturesParametrsPageState
    extends State<NomenclaturesParametrsPage> {
  final NomenclaturesParametrsBloc _paramNomBloc = NomenclaturesParametrsBloc(
      GetIt.I<NomenclaturesParametrsRepo>(), GetIt.I<UnitsRepo>());
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _paramNomBloc.add(LoadNomenclaturesParametrsListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _paramNomBloc.add(LoadNomenclaturesParametrsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      if (!authState.user.is_staff) {
        return const Center(
          child: Text("Доступ закрыт"),
        );
      }
    }
    return RefreshIndicator(
      onRefresh: () async {
        return refreshList();
      },
      child:
          BlocBuilder<NomenclaturesParametrsBloc, NomenclaturesParametrsState>(
        bloc: _paramNomBloc,
        builder: (context, state) {
          if (state is NomenclaturesParametrsListLoadedState) {
            final paramNomList = state.paramsNomList!;
            final isEnd = state.isEnd!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
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
                                  style: theme.textTheme.bodyMedium,
                                  decoration:
                                      const InputDecoration(hintText: 'Поиск'),
                                ),
                              ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  NomenclaturesParametrsCreateFromWidget(
                                bloc: _paramNomBloc,
                              ),
                            );
                          },
                          style: buttonsTheme.iconButtonAdd,
                          tooltip: 'Создать параметр номенклатуры',
                          icon: const Icon(
                            Symbols.add,
                            color: greyBlue45Color,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                    if (width < 700)
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 200,
                          child: TextField(
                            onSubmitted: (value) {
                              refreshList();
                            },
                            controller: _textSearchController,
                            style: const TextStyle(
                                fontFamily: 'SFProDisplay', fontSize: 12),
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(7),
                                hintText: 'Поиск'),
                          ),
                        ),
                      ),
                    if (width < 700)
                      NomenclaturesParametrsListTable700Widget(
                          nomenclaturesParametrsList: paramNomList,
                          paramNomBlock: _paramNomBloc),
                    if (width >= 700)
                      NomenclaturesParametrsListTableWidget(
                        paramNomList: paramNomList,
                        paramNomBlock: _paramNomBloc,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${paramNomList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _paramNomBloc
                                .add(LoadNextNomenclaturesParametrsListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          if (state is NomenclaturesParametrsLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
