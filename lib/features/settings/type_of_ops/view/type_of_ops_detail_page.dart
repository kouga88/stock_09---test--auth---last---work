import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/bloc/type_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/type_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/widgets/type_of_ops_create_form.dart';

class TypeOpsDetailPage extends StatefulWidget {
  const TypeOpsDetailPage({super.key, required this.id});

  final int id;

  @override
  State<TypeOpsDetailPage> createState() => _TypeOpsDetailPageState();
}

class _TypeOpsDetailPageState extends State<TypeOpsDetailPage> {
  final _typeOpsBloc = TypeOpsBloc(
    GetIt.I<TypeOpsRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _typeOpsBloc.add(LoadTypeOpsDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TypeOpsDetailPage oldWidget) {
    _typeOpsBloc.add(LoadTypeOpsDetailEvent(id: widget.id));
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

    return BlocBuilder<TypeOpsBloc, TypeOpsState>(
      bloc: _typeOpsBloc,
      builder: (context, state) {
        if (state is TypeOpsLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is TypeOpsDetailLoadedState) {
          if (state.typeOps != null) {
            TypeOps typeOps = state.typeOps!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/typeOps'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(typeOps.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(typeOps.description.toString(),
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
                                TypeOpsCreateFormWidget(
                              typeOps: typeOps,
                              bloc: _typeOpsBloc,
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
// import 'package:pronet_storeroom_v_01/features/typeOpss/bloc/typeOpss_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/repo/typeOps_repo.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/repo/models/typeOps.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/widgets/TypeOps_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/widgets/typeOps_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/widgets/typeOps_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/widgets/typeOps_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/typeOpss/widgets/typeOps_role_list.dart';

// class TypeOpsDetailPage extends StatefulWidget {
//   const TypeOpsDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<TypeOpsDetailPage> createState() => _TypeOpsDetailPageState();
// }

// class _TypeOpsDetailPageState extends State<TypeOpsDetailPage> {
//   final _typeOpsBloc =
//       TypeOpsBloc(GetIt.I<TypeOpsRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _typeOpsBloc.add(LoadTypeOpsDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant TypeOpsDetailPage oldWidget) {
//     _typeOpsBloc.add(LoadTypeOpsDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.typeOps.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<TypeOpsBloc, TypeOpsState>(
//         bloc: _typeOpsBloc,
//         builder: (context, state) {
//           if (state is TypeOpsLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is TypeOpsDetailLoadedState) {
//             if (state.typeOps != null) {
//               TypeOps typeOps = state.typeOps!;
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
//                                   image: AssetImage('images/typeOps2.png'))),
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
//                     Text(typeOps.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(typeOps.typeOpsname,
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
//                                   TypeOpsCreateFromWidget(
//                                 typeOps: typeOps,
//                                 bloc: _typeOpsBloc,
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
//                                   TypeOpsEditPasswordForm(
//                                 bloc: _typeOpsBloc,
//                                 typeOps: typeOps,
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
//                     TypeOpsRoleListWidget(theme: theme, typeOps: typeOps),
//                     const SizedBox(height: 10),
//                     TypeOpsProjectListWidget(theme: theme, typeOps: typeOps),
//                     const SizedBox(height: 10),
//                     TypeOpsGroupListWidget(theme: theme, typeOps: typeOps),
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