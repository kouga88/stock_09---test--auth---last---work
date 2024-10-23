import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/bloc/units_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/widgets/units_create_form.dart';

class UnitsDetailPage extends StatefulWidget {
  const UnitsDetailPage({super.key, required this.id});

  final int id;

  @override
  State<UnitsDetailPage> createState() => _UnitsDetailPageState();
}

class _UnitsDetailPageState extends State<UnitsDetailPage> {
  final _unitsBloc = UnitsBloc(
    GetIt.I<UnitsRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _unitsBloc.add(LoadUnitsDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UnitsDetailPage oldWidget) {
    _unitsBloc.add(LoadUnitsDetailEvent(id: widget.id));
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

    return BlocBuilder<UnitsBloc, UnitsState>(
      bloc: _unitsBloc,
      builder: (context, state) {
        if (state is UnitsLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is UnitsDetailLoadedState) {
          if (state.units != null) {
            Units units = state.units!;

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
                  Text(units.full_name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(units.description.toString(),
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
                                UnitsCreateFromWidget(
                              units: units,
                              bloc: _unitsBloc,
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
// import 'package:pronet_storeroom_v_01/features/unitss/bloc/unitss_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/repo/units_repo.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/repo/models/units.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/widgets/Units_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/widgets/units_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/widgets/units_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/widgets/units_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/unitss/widgets/units_role_list.dart';

// class UnitsDetailPage extends StatefulWidget {
//   const UnitsDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<UnitsDetailPage> createState() => _UnitsDetailPageState();
// }

// class _UnitsDetailPageState extends State<UnitsDetailPage> {
//   final _unitsBloc =
//       UnitsBloc(GetIt.I<UnitsRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _unitsBloc.add(LoadUnitsDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant UnitsDetailPage oldWidget) {
//     _unitsBloc.add(LoadUnitsDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.units.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<UnitsBloc, UnitsState>(
//         bloc: _unitsBloc,
//         builder: (context, state) {
//           if (state is UnitsLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is UnitsDetailLoadedState) {
//             if (state.units != null) {
//               Units units = state.units!;
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
//                                   image: AssetImage('images/units2.png'))),
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
//                     Text(units.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(units.unitsname,
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
//                                   UnitsCreateFromWidget(
//                                 units: units,
//                                 bloc: _unitsBloc,
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
//                                   UnitsEditPasswordForm(
//                                 bloc: _unitsBloc,
//                                 units: units,
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
//                     UnitsRoleListWidget(theme: theme, units: units),
//                     const SizedBox(height: 10),
//                     UnitsProjectListWidget(theme: theme, units: units),
//                     const SizedBox(height: 10),
//                     UnitsGroupListWidget(theme: theme, units: units),
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