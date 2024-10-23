import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/bloc/nomenclatueres_group_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/widgets/nomenclatueres_group_create_form.dart';

class NomenclaturesGroupDetailPage extends StatefulWidget {
  const NomenclaturesGroupDetailPage({super.key, required this.id});

  final int id;

  @override
  State<NomenclaturesGroupDetailPage> createState() =>
      _NomenclaturesGroupDetailPageState();
}

class _NomenclaturesGroupDetailPageState
    extends State<NomenclaturesGroupDetailPage> {
  final _nomenclaturesGroupBloc = NomenclaturesGroupBloc(
    GetIt.I<NomenclaturesGroupRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _nomenclaturesGroupBloc
        .add(LoadNomenclaturesGroupDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NomenclaturesGroupDetailPage oldWidget) {
    _nomenclaturesGroupBloc
        .add(LoadNomenclaturesGroupDetailEvent(id: widget.id));
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

    return BlocBuilder<NomenclaturesGroupBloc, NomenclaturesGroupState>(
      bloc: _nomenclaturesGroupBloc,
      builder: (context, state) {
        if (state is NomenclaturesGroupLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is NomenclaturesGroupDetailLoadedState) {
          if (state.nomenclaturesGroup != null) {
            NomenclaturesGroup nomenclaturesGroup = state.nomenclaturesGroup!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/nomenclaturesGroup'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(nomenclaturesGroup.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(nomenclaturesGroup.description.toString(),
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
                                NomenclaturesGroupCreateFormWidget(
                              nomenclaturesGroup: nomenclaturesGroup,
                              bloc: _nomenclaturesGroupBloc,
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
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/bloc/nomenclaturesGroups_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/repo/nomenclaturesGroup_repo.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/repo/models/nomenclaturesGroup.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/widgets/NomenclaturesGroup_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/widgets/nomenclaturesGroup_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/widgets/nomenclaturesGroup_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/widgets/nomenclaturesGroup_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturesGroups/widgets/nomenclaturesGroup_role_list.dart';

// class NomenclaturesGroupDetailPage extends StatefulWidget {
//   const NomenclaturesGroupDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<NomenclaturesGroupDetailPage> createState() => _NomenclaturesGroupDetailPageState();
// }

// class _NomenclaturesGroupDetailPageState extends State<NomenclaturesGroupDetailPage> {
//   final _nomenclaturesGroupBloc =
//       NomenclaturesGroupBloc(GetIt.I<NomenclaturesGroupRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _nomenclaturesGroupBloc.add(LoadNomenclaturesGroupDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant NomenclaturesGroupDetailPage oldWidget) {
//     _nomenclaturesGroupBloc.add(LoadNomenclaturesGroupDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.nomenclaturesGroup.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<NomenclaturesGroupBloc, NomenclaturesGroupState>(
//         bloc: _nomenclaturesGroupBloc,
//         builder: (context, state) {
//           if (state is NomenclaturesGroupLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is NomenclaturesGroupDetailLoadedState) {
//             if (state.nomenclaturesGroup != null) {
//               NomenclaturesGroup nomenclaturesGroup = state.nomenclaturesGroup!;
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
//                                   image: AssetImage('images/nomenclaturesGroup2.png'))),
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
//                     Text(nomenclaturesGroup.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(nomenclaturesGroup.nomenclaturesGroupname,
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
//                                   NomenclaturesGroupCreateFromWidget(
//                                 nomenclaturesGroup: nomenclaturesGroup,
//                                 bloc: _nomenclaturesGroupBloc,
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
//                                   NomenclaturesGroupEditPasswordForm(
//                                 bloc: _nomenclaturesGroupBloc,
//                                 nomenclaturesGroup: nomenclaturesGroup,
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
//                     NomenclaturesGroupRoleListWidget(theme: theme, nomenclaturesGroup: nomenclaturesGroup),
//                     const SizedBox(height: 10),
//                     NomenclaturesGroupProjectListWidget(theme: theme, nomenclaturesGroup: nomenclaturesGroup),
//                     const SizedBox(height: 10),
//                     NomenclaturesGroupGroupListWidget(theme: theme, nomenclaturesGroup: nomenclaturesGroup),
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