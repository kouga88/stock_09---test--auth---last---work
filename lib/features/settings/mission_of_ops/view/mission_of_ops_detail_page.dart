import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/bloc/mission_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/mission_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/widgets/mission_of_ops_create_form.dart';

class MissionOperationsDetailPage extends StatefulWidget {
  const MissionOperationsDetailPage({super.key, required this.id});

  final int id;

  @override
  State<MissionOperationsDetailPage> createState() =>
      _MissionOperationsDetailPageState();
}

class _MissionOperationsDetailPageState
    extends State<MissionOperationsDetailPage> {
  final _missionOperationsBloc = MissionOperationsBloc(
    GetIt.I<MissionOperationsRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _missionOperationsBloc.add(LoadMissionOperationsDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MissionOperationsDetailPage oldWidget) {
    _missionOperationsBloc.add(LoadMissionOperationsDetailEvent(id: widget.id));
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

    return BlocBuilder<MissionOperationsBloc, MissionOperationsState>(
      bloc: _missionOperationsBloc,
      builder: (context, state) {
        if (state is MissionOperationsLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is MissionOperationsDetailLoadedState) {
          if (state.missionOperations != null) {
            MissionOperations missionOperations = state.missionOperations!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/missionOperations'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(missionOperations.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(missionOperations.description.toString(),
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
                                MissionOperationsCreateFormWidget(
                              missionOperations: missionOperations,
                              bloc: _missionOperationsBloc,
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
// import 'package:pronet_storeroom_v_01/features/missionOperationss/bloc/missionOperationss_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/repo/missionOperations_repo.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/repo/models/missionOperations.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/widgets/MissionOperations_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/widgets/missionOperations_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/widgets/missionOperations_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/widgets/missionOperations_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/missionOperationss/widgets/missionOperations_role_list.dart';

// class MissionOperationsDetailPage extends StatefulWidget {
//   const MissionOperationsDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<MissionOperationsDetailPage> createState() => _MissionOperationsDetailPageState();
// }

// class _MissionOperationsDetailPageState extends State<MissionOperationsDetailPage> {
//   final _missionOperationsBloc =
//       MissionOperationsBloc(GetIt.I<MissionOperationsRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _missionOperationsBloc.add(LoadMissionOperationsDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant MissionOperationsDetailPage oldWidget) {
//     _missionOperationsBloc.add(LoadMissionOperationsDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.missionOperations.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<MissionOperationsBloc, MissionOperationsState>(
//         bloc: _missionOperationsBloc,
//         builder: (context, state) {
//           if (state is MissionOperationsLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is MissionOperationsDetailLoadedState) {
//             if (state.missionOperations != null) {
//               MissionOperations missionOperations = state.missionOperations!;
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
//                                   image: AssetImage('images/missionOperations2.png'))),
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
//                     Text(missionOperations.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(missionOperations.missionOperationsname,
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
//                                   MissionOperationsCreateFromWidget(
//                                 missionOperations: missionOperations,
//                                 bloc: _missionOperationsBloc,
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
//                                   MissionOperationsEditPasswordForm(
//                                 bloc: _missionOperationsBloc,
//                                 missionOperations: missionOperations,
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
//                     MissionOperationsRoleListWidget(theme: theme, missionOperations: missionOperations),
//                     const SizedBox(height: 10),
//                     MissionOperationsProjectListWidget(theme: theme, missionOperations: missionOperations),
//                     const SizedBox(height: 10),
//                     MissionOperationsGroupListWidget(theme: theme, missionOperations: missionOperations),
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