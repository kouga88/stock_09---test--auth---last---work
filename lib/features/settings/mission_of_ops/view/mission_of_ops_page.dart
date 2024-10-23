import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/bloc/mission_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/mission_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/widgets/mission_of_ops_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/widgets/mission_of_ops_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class MissionOperationsPage extends StatefulWidget {
  const MissionOperationsPage({super.key});

  @override
  State<MissionOperationsPage> createState() => _MissionOperationsPageState();
}

class _MissionOperationsPageState extends State<MissionOperationsPage> {
  final MissionOperationsBloc _missionOperationsBloc = MissionOperationsBloc(
    GetIt.I<MissionOperationsRepo>(),
  );
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _missionOperationsBloc.add(LoadMissionOperationsListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _missionOperationsBloc.add(LoadMissionOperationsListEvent());
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
      child: BlocBuilder<MissionOperationsBloc, MissionOperationsState>(
        bloc: _missionOperationsBloc,
        builder: (context, state) {
          if (state is MissionOperationsListLoadedState) {
            final missionOperationsList = state.missionOperationsList!;
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
                                    MissionOperationsCreateFormWidget(
                                  bloc: _missionOperationsBloc,
                                ),
                              );
                            },
                            style: buttonsTheme.iconButtonAdd,
                            tooltip: 'Создать цель выдачи',
                            icon: const Icon(
                              Symbols.add,
                              color: greyBlue45Color,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    MissionOperationsListTableWidget(
                      missionOperationsList: missionOperationsList,
                      missionOperationsBloc: _missionOperationsBloc,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${missionOperationsList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _missionOperationsBloc
                                .add(LoadNextMissionOperationsListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is MissionOperationsLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
