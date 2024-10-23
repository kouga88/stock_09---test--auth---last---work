import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_create_form.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/bloc/storerooms_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_list_table.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_list_table_700.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class StoreroomListPage extends StatefulWidget {
  const StoreroomListPage({super.key});

  @override
  State<StoreroomListPage> createState() => _StoreroomListPageState();
}

class _StoreroomListPageState extends State<StoreroomListPage> {
  final StoreroomBloc _storeroomBloc = StoreroomBloc(
      GetIt.I<StoreroomRepo>(),
      GetIt.I<OrganizationRepo>(),
      GetIt.I<DepartmentRepo>()); // ,GetIt.I<TaskRepo>()
  final _textSearchController = TextEditingController();
  // bool _isFilterBoxOpen = false;

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _storeroomBloc.add(LoadStoreroomListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _storeroomBloc.add(LoadStoreroomListEvent());
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
      child: BlocBuilder<StoreroomBloc, StoreroomState>(
        bloc: _storeroomBloc,
        builder: (context, state) {
          if (state is StoreroomListLoadedState) {
            final storeroomList = state.storeroomList!;
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
                                  StoreroomCreateFromWidget(
                                bloc: _storeroomBloc,
                              ),
                            );
                          },
                          style: buttonsTheme.iconButtonAdd,
                          tooltip: 'Создать склад',
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
                      StoreroomListTable700Widget(
                          storeroomList: storeroomList,
                          storeroomBloc: _storeroomBloc),
                    if (width >= 700)
                      StoreroomListTableWidget(
                        storeroomList: storeroomList,
                        storeroomBloc: _storeroomBloc,
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${storeroomList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _storeroomBloc.add(LoadNextStoreroomListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is StoreroomLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
