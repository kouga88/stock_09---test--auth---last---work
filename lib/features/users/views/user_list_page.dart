import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/bloc/user_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_list_filters.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/User_create_form.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/user_list_table.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/user_list_table_700.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final UserBloc _userBloc = UserBloc(
      GetIt.I<UserRepo>(),
      GetIt.I<OrganizationRepo>(),
      GetIt.I<DepartmentRepo>()); // ,GetIt.I<TaskRepo>()
  final _textSearchController = TextEditingController();
  final UserrsListFilters filters = UserrsListFilters();
  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _userBloc.add(LoadUserListEvent(
        completer: completer,
        searchText: _textSearchController.text,
        filterIsStaff: filters.is_staff,
        filterIsActive: filters.is_active,
        filterIsSuperUser: filters.is_superuser));
    return completer.future;
  }

  @override
  void initState() {
    _userBloc.add(LoadUserListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final authState = authBloc.state;

    if (authState is AuthSuccessedState && !authState.user.is_active) {
      return const Center(
        child: Text("Доступ закрыт"),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        return refreshList();
      },
      child: BlocBuilder<UserBloc, UserState>(
        bloc: _userBloc,
        builder: (context, state) {
          if (state is UserListLoadedState) {
            final userList = state.userList!;
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
                        if (authState is AuthSuccessedState &&
                            authState.user.is_staff)
                          IconButton(
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) =>
                                    UserCreateFromWidget(
                                  bloc: _userBloc,
                                ),
                              );
                            },
                            tooltip: 'Создать пользователя',
                            icon: const Icon(
                              Symbols.person_add,
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
                      UserListTable700Widget(
                          userList: userList, userBloc: _userBloc),
                    if (width >= 700 && authState is AuthSuccessedState)
                      UserListTableWidget(
                        authState: authState,
                        userList: userList,
                        userBloc: _userBloc,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text('${userList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _userBloc.add(LoadNextUserListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is UserLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
