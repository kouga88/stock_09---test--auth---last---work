import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/nomenclatueres_group_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/bloc/nomenclatures_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/nomenclatures_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/widgets/nomenclatures_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/nomenclatures_parametrs_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/storerooms_repo.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/units_repo.dart';

class NomenclaturesDetailPage extends StatefulWidget {
  const NomenclaturesDetailPage({super.key, required this.id});

  final int id;

  @override
  State<NomenclaturesDetailPage> createState() =>
      _NomenclaturesDetailPageState();
}

class _NomenclaturesDetailPageState extends State<NomenclaturesDetailPage> {
  final _nomenclaturesBloc = NomenclaturesBloc(
    GetIt.I<NomenclaturesRepo>(),
    GetIt.I<UnitsRepo>(),
    GetIt.I<StoreroomRepo>(),
    GetIt.I<NomenclaturesParametrsRepo>(),
    GetIt.I<NomenclaturesGroupRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _nomenclaturesBloc.add(LoadNomenclaturesDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NomenclaturesDetailPage oldWidget) {
    _nomenclaturesBloc.add(LoadNomenclaturesDetailEvent(id: widget.id));
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

    return BlocBuilder<NomenclaturesBloc, NomenclaturesState>(
      bloc: _nomenclaturesBloc,
      builder: (context, state) {
        if (state is NomenclaturesLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is NomenclaturesDetailLoadedState) {
          if (state.nomenclatures != null) {
            Nomenclatures nomenclatures = state.nomenclatures!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context.go(
                            '/settings/nomenclatures'), // Go back to the previous screen
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(nomenclatures.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(nomenclatures.description.toString(),
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
                                NomenclaturesCreateFormWidget(
                              nomenclatures: nomenclatures,
                              bloc: _nomenclaturesBloc,
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
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/bloc/nomenclaturess_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/repo/nomenclatures_repo.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/repo/models/nomenclatures.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/widgets/Nomenclatures_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/widgets/nomenclatures_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/widgets/nomenclatures_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/widgets/nomenclatures_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/nomenclaturess/widgets/nomenclatures_role_list.dart';

// class NomenclaturesDetailPage extends StatefulWidget {
//   const NomenclaturesDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<NomenclaturesDetailPage> createState() => _NomenclaturesDetailPageState();
// }

// class _NomenclaturesDetailPageState extends State<NomenclaturesDetailPage> {
//   final _nomenclaturesBloc =
//       NomenclaturesBloc(GetIt.I<NomenclaturesRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _nomenclaturesBloc.add(LoadNomenclaturesDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant NomenclaturesDetailPage oldWidget) {
//     _nomenclaturesBloc.add(LoadNomenclaturesDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.nomenclatures.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<NomenclaturesBloc, NomenclaturesState>(
//         bloc: _nomenclaturesBloc,
//         builder: (context, state) {
//           if (state is NomenclaturesLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is NomenclaturesDetailLoadedState) {
//             if (state.nomenclatures != null) {
//               Nomenclatures nomenclatures = state.nomenclatures!;
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
//                                   image: AssetImage('images/nomenclatures2.png'))),
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
//                     Text(nomenclatures.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(nomenclatures.nomenclaturesname,
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
//                                   NomenclaturesCreateFromWidget(
//                                 nomenclatures: nomenclatures,
//                                 bloc: _nomenclaturesBloc,
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
//                                   NomenclaturesEditPasswordForm(
//                                 bloc: _nomenclaturesBloc,
//                                 nomenclatures: nomenclatures,
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
//                     NomenclaturesRoleListWidget(theme: theme, nomenclatures: nomenclatures),
//                     const SizedBox(height: 10),
//                     NomenclaturesProjectListWidget(theme: theme, nomenclatures: nomenclatures),
//                     const SizedBox(height: 10),
//                     NomenclaturesGroupListWidget(theme: theme, nomenclatures: nomenclatures),
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