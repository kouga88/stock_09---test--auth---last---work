import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/bloc/accounting_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/models/accounting.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/repo/accounting_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/accounting/widgets/accounting_create_form.dart';

class AccountingDetailPage extends StatefulWidget {
  const AccountingDetailPage({super.key, required this.id});

  final int id;

  @override
  State<AccountingDetailPage> createState() => _AccountingDetailPageState();
}

class _AccountingDetailPageState extends State<AccountingDetailPage> {
  final _accountingBloc = AccountingBloc(
    GetIt.I<AccountingRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _accountingBloc.add(LoadAccountingDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AccountingDetailPage oldWidget) {
    _accountingBloc.add(LoadAccountingDetailEvent(id: widget.id));
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isAdmin = false;
    if (authBloc.state is AuthSuccessedState) {
      final authState = (authBloc.state as AuthSuccessedState);
      isAdmin = authState.user.is_staff;
    }

    return BlocBuilder<AccountingBloc, AccountingState>(
      bloc: _accountingBloc,
      builder: (context, state) {
        if (state is AccountingLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is AccountingDetailLoadedState) {
          if (state.accounting != null) {
            Accounting accounting = state.accounting!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => GoRouter.of(context)
                            .pop(), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(accounting.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(accounting.name.toString(),
                      style: Theme.of(context).textTheme.headlineSmall),
                  if (isAdmin) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                AccountingCreateFromWidget(
                              accounting: accounting,
                              bloc: _accountingBloc,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          side: BorderSide.none,
                        ),
                        child: const Text('Редактировать'),
                      ),
                    ),
                  ],
                  const SizedBox(height: 30),
                  const Divider(),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

// старая версия

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
// import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/bloc/accountings_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/repo/accounting_repo.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/repo/models/accounting.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/widgets/Accounting_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/widgets/accounting_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/widgets/accounting_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/widgets/accounting_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/accountings/widgets/accounting_role_list.dart';

// class AccountingDetailPage extends StatefulWidget {
//   const AccountingDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<AccountingDetailPage> createState() => _AccountingDetailPageState();
// }

// class _AccountingDetailPageState extends State<AccountingDetailPage> {
//   final _accountingBloc =
//       AccountingBloc(GetIt.I<AccountingRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _accountingBloc.add(LoadAccountingDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant AccountingDetailPage oldWidget) {
//     _accountingBloc.add(LoadAccountingDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.accounting.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<AccountingBloc, AccountingState>(
//         bloc: _accountingBloc,
//         builder: (context, state) {
//           if (state is AccountingLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is AccountingDetailLoadedState) {
//             if (state.accounting != null) {
//               Accounting accounting = state.accounting!;
//               return Container(
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: IconButton(
//                         onPressed: () =>
//                             Navigator.pop(context), // context.router.back(),
//                         icon: const Icon(Icons.arrow_back),
//                         tooltip: 'Назад',
//                       ),
//                     ),

//                     /// -- IMAGE
//                     Stack(
//                       children: [
//                         SizedBox(
//                           width: 120,
//                           height: 120,
//                           child: ClipRRect(
//                               borderRadius: BorderRadius.circular(100),
//                               child: const Image(
//                                   image: AssetImage('images/accounting2.png'))),
//                         ),
//                         // Positioned(
//                         //   bottom: 0,
//                         //   right: 0,
//                         //   child: Container(
//                         //     width: 35,
//                         //     height: 35,
//                         //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: theme.primaryColor),
//                         //     child: const Icon(
//                         //       Icons.edit,
//                         //       color: Colors.black,
//                         //       size: 20,
//                         //     ),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Text(accounting.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(accounting.accountingname,
//                         style: Theme.of(context).textTheme.headlineSmall),

//                     /// -- BUTTON
//                     if (isAdmin) ...[
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             showDialog<String>(
//                               context: context,
//                               builder: (BuildContext context) =>
//                                   AccountingCreateFromWidget(
//                                 accounting: accounting,
//                                 bloc: _accountingBloc,
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: theme.primaryColor,
//                               side: BorderSide.none),
//                           child: const Text('Редактировать'),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             showDialog<String>(
//                               context: context,
//                               builder: (BuildContext context) =>
//                                   AccountingEditPasswordForm(
//                                 bloc: _accountingBloc,
//                                 accounting: accounting,
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: theme.primaryColor,
//                               side: BorderSide.none),
//                           child: const Text('Сменить пароль'),
//                         ),
//                       ),
//                     ],
//                     const SizedBox(height: 30),
//                     const Divider(),
//                     const SizedBox(height: 10),
//                     AccountingRoleListWidget(theme: theme, accounting: accounting),
//                     const SizedBox(height: 10),
//                     AccountingProjectListWidget(theme: theme, accounting: accounting),
//                     const SizedBox(height: 10),
//                     AccountingGroupListWidget(theme: theme, accounting: accounting),
//                   ],
//                 ),
//               );
//             }
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }