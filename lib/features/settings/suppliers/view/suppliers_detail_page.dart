import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/bloc/suppliers_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/suppliers_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/widgets/suppliers_create_form.dart';

class SuppliersDetailPage extends StatefulWidget {
  const SuppliersDetailPage({super.key, required this.id});

  final int id;

  @override
  State<SuppliersDetailPage> createState() => _SuppliersDetailPageState();
}

class _SuppliersDetailPageState extends State<SuppliersDetailPage> {
  final _suppliersBloc = SuppliersBloc(
    GetIt.I<SuppliersRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _suppliersBloc.add(LoadSuppliersDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SuppliersDetailPage oldWidget) {
    _suppliersBloc.add(LoadSuppliersDetailEvent(id: widget.id));
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

    return BlocBuilder<SuppliersBloc, SuppliersState>(
      bloc: _suppliersBloc,
      builder: (context, state) {
        if (state is SuppliersLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is SuppliersDetailLoadedState) {
          if (state.suppliers != null) {
            Suppliers suppliers = state.suppliers!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/suppliers'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(suppliers.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(suppliers.description.toString(),
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
                                SuppliersCreateFormWidget(
                              suppliers: suppliers,
                              bloc: _suppliersBloc,
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
// import 'package:pronet_storeroom_v_01/features/supplierss/bloc/supplierss_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/repo/suppliers_repo.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/repo/models/suppliers.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/widgets/Suppliers_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/widgets/suppliers_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/widgets/suppliers_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/widgets/suppliers_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/supplierss/widgets/suppliers_role_list.dart';

// class SuppliersDetailPage extends StatefulWidget {
//   const SuppliersDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<SuppliersDetailPage> createState() => _SuppliersDetailPageState();
// }

// class _SuppliersDetailPageState extends State<SuppliersDetailPage> {
//   final _suppliersBloc =
//       SuppliersBloc(GetIt.I<SuppliersRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _suppliersBloc.add(LoadSuppliersDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant SuppliersDetailPage oldWidget) {
//     _suppliersBloc.add(LoadSuppliersDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.suppliers.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<SuppliersBloc, SuppliersState>(
//         bloc: _suppliersBloc,
//         builder: (context, state) {
//           if (state is SuppliersLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is SuppliersDetailLoadedState) {
//             if (state.suppliers != null) {
//               Suppliers suppliers = state.suppliers!;
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
//                                   image: AssetImage('images/suppliers2.png'))),
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
//                     Text(suppliers.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(suppliers.suppliersname,
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
//                                   SuppliersCreateFromWidget(
//                                 suppliers: suppliers,
//                                 bloc: _suppliersBloc,
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
//                                   SuppliersEditPasswordForm(
//                                 bloc: _suppliersBloc,
//                                 suppliers: suppliers,
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
//                     SuppliersRoleListWidget(theme: theme, suppliers: suppliers),
//                     const SizedBox(height: 10),
//                     SuppliersProjectListWidget(theme: theme, suppliers: suppliers),
//                     const SizedBox(height: 10),
//                     SuppliersGroupListWidget(theme: theme, suppliers: suppliers),
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