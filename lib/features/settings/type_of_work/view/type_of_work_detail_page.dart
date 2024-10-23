import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/bloc/type_of_work_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/type_of_work_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/widgets/type_of_work_create_form.dart';

class TypeWorkDetailPage extends StatefulWidget {
  const TypeWorkDetailPage({super.key, required this.id});

  final int id;

  @override
  State<TypeWorkDetailPage> createState() => _TypeWorkDetailPageState();
}

class _TypeWorkDetailPageState extends State<TypeWorkDetailPage> {
  final _typeWorkBloc = TypeWorkBloc(
    GetIt.I<TypeWorkRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _typeWorkBloc.add(LoadTypeWorkDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TypeWorkDetailPage oldWidget) {
    _typeWorkBloc.add(LoadTypeWorkDetailEvent(id: widget.id));
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

    return BlocBuilder<TypeWorkBloc, TypeWorkState>(
      bloc: _typeWorkBloc,
      builder: (context, state) {
        if (state is TypeWorkLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is TypeWorkDetailLoadedState) {
          if (state.typeWork != null) {
            TypeWork typeWork = state.typeWork!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/typeWork'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(typeWork.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(typeWork.description.toString(),
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
                                TypeWorkCreateFormWidget(
                              typeWork: typeWork,
                              bloc: _typeWorkBloc,
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
// import 'package:pronet_storeroom_v_01/features/typeWorks/bloc/typeWorks_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/repo/typeWork_repo.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/repo/models/typeWork.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/widgets/TypeWork_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/widgets/typeWork_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/widgets/typeWork_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/widgets/typeWork_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/typeWorks/widgets/typeWork_role_list.dart';

// class TypeWorkDetailPage extends StatefulWidget {
//   const TypeWorkDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<TypeWorkDetailPage> createState() => _TypeWorkDetailPageState();
// }

// class _TypeWorkDetailPageState extends State<TypeWorkDetailPage> {
//   final _typeWorkBloc =
//       TypeWorkBloc(GetIt.I<TypeWorkRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _typeWorkBloc.add(LoadTypeWorkDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant TypeWorkDetailPage oldWidget) {
//     _typeWorkBloc.add(LoadTypeWorkDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.typeWork.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<TypeWorkBloc, TypeWorkState>(
//         bloc: _typeWorkBloc,
//         builder: (context, state) {
//           if (state is TypeWorkLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is TypeWorkDetailLoadedState) {
//             if (state.typeWork != null) {
//               TypeWork typeWork = state.typeWork!;
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
//                                   image: AssetImage('images/typeWork2.png'))),
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
//                     Text(typeWork.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(typeWork.typeWorkname,
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
//                                   TypeWorkCreateFromWidget(
//                                 typeWork: typeWork,
//                                 bloc: _typeWorkBloc,
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
//                                   TypeWorkEditPasswordForm(
//                                 bloc: _typeWorkBloc,
//                                 typeWork: typeWork,
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
//                     TypeWorkRoleListWidget(theme: theme, typeWork: typeWork),
//                     const SizedBox(height: 10),
//                     TypeWorkProjectListWidget(theme: theme, typeWork: typeWork),
//                     const SizedBox(height: 10),
//                     TypeWorkGroupListWidget(theme: theme, typeWork: typeWork),
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