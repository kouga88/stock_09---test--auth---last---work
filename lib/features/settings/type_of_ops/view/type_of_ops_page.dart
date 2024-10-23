import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/bloc/type_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/type_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/widgets/type_of_ops_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/widgets/type_of_ops_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class TypeOpsPage extends StatefulWidget {
  const TypeOpsPage({super.key});

  @override
  State<TypeOpsPage> createState() => _TypeOpsPageState();
}

class _TypeOpsPageState extends State<TypeOpsPage> {
  final TypeOpsBloc _typeOpsBloc = TypeOpsBloc(
    GetIt.I<TypeOpsRepo>(),
  );
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _typeOpsBloc.add(LoadTypeOpsListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _typeOpsBloc.add(LoadTypeOpsListEvent());
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
      child: BlocBuilder<TypeOpsBloc, TypeOpsState>(
        bloc: _typeOpsBloc,
        builder: (context, state) {
          if (state is TypeOpsListLoadedState) {
            final typeOpsList = state.typeOpsList!;
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
                                    TypeOpsCreateFormWidget(
                                  bloc: _typeOpsBloc,
                                ),
                              );
                            },
                            style: buttonsTheme.iconButtonAdd,
                            tooltip: 'Создать тип операции',
                            icon: const Icon(
                              Symbols.add,
                              color: greyBlue45Color,
                              size: 26,
                            ),
                          ),
                        ],
                      ),
                    TypeOpsListTableWidget(
                      typeOpsList: typeOpsList,
                      typeOpsBloc: _typeOpsBloc,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child:
                            Text('${typeOpsList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _typeOpsBloc.add(LoadNextTypeOpsListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is TypeOpsLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
