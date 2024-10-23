import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/bloc/directions_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/directions_of_ops_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/widgets/directions_of_ops_create_form.dart';

class DirectionsOpsDetailPage extends StatefulWidget {
  const DirectionsOpsDetailPage({super.key, required this.id});

  final int id;

  @override
  State<DirectionsOpsDetailPage> createState() =>
      _DirectionsOpsDetailPageState();
}

class _DirectionsOpsDetailPageState extends State<DirectionsOpsDetailPage> {
  final _directionsOpsBloc = DirectionsOpsBloc(
    GetIt.I<DirectionsOpsRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _directionsOpsBloc.add(LoadDirectionsOpsDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DirectionsOpsDetailPage oldWidget) {
    _directionsOpsBloc.add(LoadDirectionsOpsDetailEvent(id: widget.id));
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

    return BlocBuilder<DirectionsOpsBloc, DirectionsOpsState>(
      bloc: _directionsOpsBloc,
      builder: (context, state) {
        if (state is DirectionsOpsLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is DirectionsOpsDetailLoadedState) {
          if (state.directionsOps != null) {
            DirectionsOps directionsOps = state.directionsOps!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/directionsOps'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(directionsOps.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(directionsOps.description.toString(),
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
                                DirectionsOpsCreateFormWidget(
                              directionsOps: directionsOps,
                              bloc: _directionsOpsBloc,
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
// import 'package:pronet_storeroom_v_01/features/directionsOpss/bloc/directionsOpss_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/repo/directionsOps_repo.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/repo/models/directionsOps.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/widgets/DirectionsOps_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/widgets/directionsOps_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/widgets/directionsOps_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/widgets/directionsOps_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/directionsOpss/widgets/directionsOps_role_list.dart';

// class DirectionsOpsDetailPage extends StatefulWidget {
//   const DirectionsOpsDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<DirectionsOpsDetailPage> createState() => _DirectionsOpsDetailPageState();
// }

// class _DirectionsOpsDetailPageState extends State<DirectionsOpsDetailPage> {
//   final _directionsOpsBloc =
//       DirectionsOpsBloc(GetIt.I<DirectionsOpsRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _directionsOpsBloc.add(LoadDirectionsOpsDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant DirectionsOpsDetailPage oldWidget) {
//     _directionsOpsBloc.add(LoadDirectionsOpsDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.directionsOps.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<DirectionsOpsBloc, DirectionsOpsState>(
//         bloc: _directionsOpsBloc,
//         builder: (context, state) {
//           if (state is DirectionsOpsLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is DirectionsOpsDetailLoadedState) {
//             if (state.directionsOps != null) {
//               DirectionsOps directionsOps = state.directionsOps!;
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
//                                   image: AssetImage('images/directionsOps2.png'))),
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
//                     Text(directionsOps.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(directionsOps.directionsOpsname,
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
//                                   DirectionsOpsCreateFromWidget(
//                                 directionsOps: directionsOps,
//                                 bloc: _directionsOpsBloc,
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
//                                   DirectionsOpsEditPasswordForm(
//                                 bloc: _directionsOpsBloc,
//                                 directionsOps: directionsOps,
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
//                     DirectionsOpsRoleListWidget(theme: theme, directionsOps: directionsOps),
//                     const SizedBox(height: 10),
//                     DirectionsOpsProjectListWidget(theme: theme, directionsOps: directionsOps),
//                     const SizedBox(height: 10),
//                     DirectionsOpsGroupListWidget(theme: theme, directionsOps: directionsOps),
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