import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/bloc/department_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/widgets/department_create_form.dart';

class DepartmentDetailPage extends StatefulWidget {
  const DepartmentDetailPage({super.key, required this.id});

  final int id;

  @override
  State<DepartmentDetailPage> createState() => _DepartmentDetailPageState();
}

class _DepartmentDetailPageState extends State<DepartmentDetailPage> {
  final _departmentBloc = DepartmentBloc(
    GetIt.I<DepartmentRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _departmentBloc.add(LoadDepartmentDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DepartmentDetailPage oldWidget) {
    _departmentBloc.add(LoadDepartmentDetailEvent(id: widget.id));
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

    return BlocBuilder<DepartmentBloc, DepartmentState>(
      bloc: _departmentBloc,
      builder: (context, state) {
        if (state is DepartmentLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is DepartmentDetailLoadedState) {
          if (state.department != null) {
            Department department = state.department!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/department'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(department.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(department.description.toString(),
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
                                DepartmentCreateFormWidget(
                              department: department,
                              bloc: _departmentBloc,
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
// import 'package:pronet_storeroom_v_01/features/departments/bloc/departments_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/departments/repo/department_repo.dart';
// import 'package:pronet_storeroom_v_01/features/departments/repo/models/department.dart';
// import 'package:pronet_storeroom_v_01/features/departments/widgets/Department_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/departments/widgets/department_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/departments/widgets/department_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/departments/widgets/department_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/departments/widgets/department_role_list.dart';

// class DepartmentDetailPage extends StatefulWidget {
//   const DepartmentDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<DepartmentDetailPage> createState() => _DepartmentDetailPageState();
// }

// class _DepartmentDetailPageState extends State<DepartmentDetailPage> {
//   final _departmentBloc =
//       DepartmentBloc(GetIt.I<DepartmentRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _departmentBloc.add(LoadDepartmentDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant DepartmentDetailPage oldWidget) {
//     _departmentBloc.add(LoadDepartmentDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.department.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<DepartmentBloc, DepartmentState>(
//         bloc: _departmentBloc,
//         builder: (context, state) {
//           if (state is DepartmentLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is DepartmentDetailLoadedState) {
//             if (state.department != null) {
//               Department department = state.department!;
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
//                                   image: AssetImage('images/department2.png'))),
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
//                     Text(department.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(department.departmentname,
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
//                                   DepartmentCreateFromWidget(
//                                 department: department,
//                                 bloc: _departmentBloc,
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
//                                   DepartmentEditPasswordForm(
//                                 bloc: _departmentBloc,
//                                 department: department,
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
//                     DepartmentRoleListWidget(theme: theme, department: department),
//                     const SizedBox(height: 10),
//                     DepartmentProjectListWidget(theme: theme, department: department),
//                     const SizedBox(height: 10),
//                     DepartmentGroupListWidget(theme: theme, department: department),
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