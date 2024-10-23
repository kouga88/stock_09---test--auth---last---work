import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/bloc/organization_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/widgets/organization_create_form.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/widgets/organization_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class OrganizationsPage extends StatefulWidget {
  const OrganizationsPage({super.key});

  @override
  State<OrganizationsPage> createState() => _OrganizationsPageState();
}

class _OrganizationsPageState extends State<OrganizationsPage> {
  final OrganizationBloc _organizationBloc = OrganizationBloc(
    GetIt.I<OrganizationRepo>(),
  );
  final _textSearchController = TextEditingController();
  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _organizationBloc.add(LoadOrganizationListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _organizationBloc.add(LoadOrganizationListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final theme = Theme.of(context);
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      if (!authState.user.is_active) {
        return const Center(
          child: Text("Доступ закрыт"),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          return refreshList();
        },
        child: BlocBuilder<OrganizationBloc, OrganizationState>(
          bloc: _organizationBloc,
          builder: (context, state) {
            if (state is OrganizationListLoadedState) {
              final organizationList = state.organizationList!;
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
                                      hintText: 'Поиск',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (authState.user.is_staff)
                              IconButton(
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        OrganizationCreateFromWidget(
                                      bloc: _organizationBloc,
                                    ),
                                  );
                                },
                                tooltip: 'Создать организацию',
                                icon: const Icon(
                                  Symbols.corporate_fare,
                                  color: greyBlue45Color,
                                  size: 26,
                                ),
                              ),
                          ],
                        ),
                      OrganizationListTableWidget(
                        authState: authState, // Передача authState
                        organizationList: organizationList,
                        organizationBloc: _organizationBloc,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              '${organizationList.length} из ${state.countAll}')),
                      const SizedBox(
                        height: 10,
                      ),
                      if (!isEnd)
                        Center(
                          child: TextButton(
                            onPressed: () {
                              _organizationBloc
                                  .add(LoadNextOrganizationListEvent());
                            },
                            child: const Text('Показать еще'),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
            if (state is OrganizationLoadingFailureState) {
              return ErrorPage(errorMessage: state.exception.toString());
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
