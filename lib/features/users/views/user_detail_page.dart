import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/department_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/bloc/user_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/User_create_form.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/user_group_list.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/user_project_list.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/user_role_list.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key, required this.id});

  final int id;

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  final _userBloc = UserBloc(GetIt.I<UserRepo>(), GetIt.I<OrganizationRepo>(),
      GetIt.I<DepartmentRepo>());
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _userBloc.add(LoadUserDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UserDetailPage oldWidget) {
    _userBloc.add(LoadUserDetailEvent(id: widget.id));
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

    return BlocBuilder<UserBloc, UserState>(
      bloc: _userBloc,
      builder: (context, state) {
        if (state is UserLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is UserDetailLoadedState) {
          if (state.user != null) {
            User user = state.user!;
            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => GoRouter.of(context)
                          .pop(), // Go back to the previous screen
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Назад',
                    ),
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "images/user.svg",
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                  Text(user.getFullName(),
                      style: theme.textTheme.headlineLarge),
                  Text(user.username,
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
                                UserCreateFromWidget(
                              user: user,
                              bloc: _userBloc,
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
                    const SizedBox(height: 5),
                  ],
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  UserRoleListWidget(theme: theme, user: user),
                  const SizedBox(height: 10),
                  UserProjectListWidget(theme: theme, user: user),
                  const SizedBox(height: 10),
                  UserGroupListWidget(theme: theme, user: user),
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
// import 'package:pronet_storeroom_v_01/features/users/bloc/users_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/users/repo/user_repo.dart';
// import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
// import 'package:pronet_storeroom_v_01/features/users/widgets/User_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/users/widgets/user_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/users/widgets/user_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/users/widgets/user_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/users/widgets/user_role_list.dart';

// class UserDetailPage extends StatefulWidget {
//   const UserDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<UserDetailPage> createState() => _UserDetailPageState();
// }

// class _UserDetailPageState extends State<UserDetailPage> {
//   final _userBloc =
//       UserBloc(GetIt.I<UserRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _userBloc.add(LoadUserDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant UserDetailPage oldWidget) {
//     _userBloc.add(LoadUserDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.user.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<UserBloc, UserState>(
//         bloc: _userBloc,
//         builder: (context, state) {
//           if (state is UserLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is UserDetailLoadedState) {
//             if (state.user != null) {
//               User user = state.user!;
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
//                                   image: AssetImage('images/user2.png'))),
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
//                     Text(user.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(user.username,
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
//                                   UserCreateFromWidget(
//                                 user: user,
//                                 bloc: _userBloc,
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
//                                   UserEditPasswordForm(
//                                 bloc: _userBloc,
//                                 user: user,
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
//                     UserRoleListWidget(theme: theme, user: user),
//                     const SizedBox(height: 10),
//                     UserProjectListWidget(theme: theme, user: user),
//                     const SizedBox(height: 10),
//                     UserGroupListWidget(theme: theme, user: user),
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