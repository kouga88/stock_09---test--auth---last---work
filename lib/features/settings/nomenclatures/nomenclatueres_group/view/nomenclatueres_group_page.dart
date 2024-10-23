import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/bloc/nomenclatueres_group_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/widgets/nomenclatueres_group_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/widgets/nomenclatueres_group_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesGroupsPage extends StatefulWidget {
  const NomenclaturesGroupsPage({super.key});

  @override
  State<NomenclaturesGroupsPage> createState() =>
      _NomenclaturesGroupsPageState();
}

class _NomenclaturesGroupsPageState extends State<NomenclaturesGroupsPage> {
  final NomenclaturesGroupBloc _nomenclaturesGroupBloc = NomenclaturesGroupBloc(
    GetIt.I<NomenclaturesGroupRepo>(),
  );
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _nomenclaturesGroupBloc.add(LoadNomenclaturesGroupListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _nomenclaturesGroupBloc.add(LoadNomenclaturesGroupListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
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
      child: BlocBuilder<NomenclaturesGroupBloc, NomenclaturesGroupState>(
        bloc: _nomenclaturesGroupBloc,
        builder: (context, state) {
          if (state is NomenclaturesGroupListLoadedState) {
            final nomenclaturesGroupList = state.nomenclaturesGroupList!;
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
                                    NomenclaturesGroupCreateFormWidget(
                                  bloc: _nomenclaturesGroupBloc,
                                ),
                              );
                            },
                            style: buttonsTheme.iconButtonAdd,
                            tooltip: 'Создать группу номенклатуры',
                            icon: const Icon(
                              Symbols.add,
                              color: greyBlue45Color,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    NomenclaturesGroupListTableWidget(
                      nomenclaturesGroupList: nomenclaturesGroupList,
                      nomenclaturesGroupBloc: _nomenclaturesGroupBloc,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${nomenclaturesGroupList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _nomenclaturesGroupBloc
                                .add(LoadNextNomenclaturesGroupListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is NomenclaturesGroupLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
