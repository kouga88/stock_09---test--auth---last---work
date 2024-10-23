import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/bloc/accounting_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/accounting_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/widgets/accounting_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/widgets/accounting_list_table.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class AccountingPage extends StatefulWidget {
  const AccountingPage({super.key});

  @override
  State<AccountingPage> createState() => _AccountingPageState();
}

class _AccountingPageState extends State<AccountingPage> {
  final AccountingBloc _accountingBloc = AccountingBloc(
    GetIt.I<AccountingRepo>(),
  );
  final _textSearchController = TextEditingController();

  final authBloc = GetIt.I<AuthBloc>();

  Future<void> refreshList() {
    final completer = Completer();
    _accountingBloc.add(LoadAccountingListEvent(
      completer: completer,
      searchText: _textSearchController.text,
    ));
    return completer.future;
  }

  @override
  void initState() {
    _accountingBloc.add(LoadAccountingListEvent());
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
      child: BlocBuilder<AccountingBloc, AccountingState>(
        bloc: _accountingBloc,
        builder: (context, state) {
          if (state is AccountingListLoadedState) {
            final accountingList = state.accountingList!;
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
                                    AccountingCreateFromWidget(
                                  bloc: _accountingBloc,
                                ),
                              );
                            },
                            style: buttonsTheme.secondaryButton,
                            icon: const Icon(
                              Symbols.add,
                              color: greyBlue45Color,
                              size: 26,
                            ),
                            tooltip: 'Создать счет учета',
                          ),
                        ],
                      ),
                    AccountingListTableWidget(
                      accountingList: accountingList,
                      accountingBloc: _accountingBloc,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                            '${accountingList.length} из ${state.countAll}')),
                    const SizedBox(
                      height: 10,
                    ),
                    if (!isEnd)
                      Center(
                        child: TextButton(
                          onPressed: () {
                            _accountingBloc.add(LoadNextAccountingListEvent());
                          },
                          child: const Text('Показать еще'),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is AccountingLoadingFailureState) {
            return ErrorPage(errorMessage: state.exception.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
