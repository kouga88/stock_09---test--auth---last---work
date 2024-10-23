import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/pages/error_page.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/bloc/organization_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/organization_repo.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/widgets/organization_create_form.dart';

class OrganizationDetailPage extends StatefulWidget {
  const OrganizationDetailPage({super.key, required this.id});

  final int id;

  @override
  State<OrganizationDetailPage> createState() => _OrganizationDetailPageState();
}

class _OrganizationDetailPageState extends State<OrganizationDetailPage> {
  final _organizationBloc = OrganizationBloc(
    GetIt.I<OrganizationRepo>(),
  );
  final authBloc = GetIt.I<AuthBloc>();

  @override
  void initState() {
    _organizationBloc.add(LoadOrganizationDetailEvent(id: widget.id));
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OrganizationDetailPage oldWidget) {
    _organizationBloc.add(LoadOrganizationDetailEvent(id: widget.id));
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

    return BlocBuilder<OrganizationBloc, OrganizationState>(
      bloc: _organizationBloc,
      builder: (context, state) {
        if (state is OrganizationLoadingFailureState) {
          return ErrorPage(errorMessage: state.exception.toString());
        }
        if (state is OrganizationDetailLoadedState) {
          if (state.organization != null) {
            Organization organization = state.organization!;

            return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => GoRouter.of(context).pop(),
                        icon: const Icon(Icons.arrow_back),
                        tooltip: 'Назад',
                      ),
                    ],
                  ),
                  Text(organization.name.toString(),
                      style: theme.textTheme.headlineLarge),
                  Text(organization.description.toString(),
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
                                OrganizationCreateFromWidget(
                              organization: organization,
                              bloc: _organizationBloc,
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
// import 'package:pronet_storeroom_v_01/features/organizations/bloc/organizations_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/repo/organization_repo.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/repo/models/organization.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/widgets/Organization_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/widgets/organization_edit_password_form.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/widgets/organization_group_list.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/widgets/organization_project_list.dart';
// import 'package:pronet_storeroom_v_01/features/organizations/widgets/organization_role_list.dart';

// class OrganizationDetailPage extends StatefulWidget {
//   const OrganizationDetailPage({super.key, required this.id});

//   final int id;

//   @override
//   State<OrganizationDetailPage> createState() => _OrganizationDetailPageState();
// }

// class _OrganizationDetailPageState extends State<OrganizationDetailPage> {
//   final _organizationBloc =
//       OrganizationBloc(GetIt.I<OrganizationRepo>()); // , GetIt.I<TaskRepo>()
//   final authBloc = GetIt.I<AuthBloc>();

//   @override
//   void initState() {
//     _organizationBloc.add(LoadOrganizationDetailEvent(id: widget.id));
//     super.initState();
//   }

//   @override
//   void didUpdateWidget(covariant OrganizationDetailPage oldWidget) {
//     _organizationBloc.add(LoadOrganizationDetailEvent(id: widget.id));
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     bool isAdmin = false;
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       isAdmin = authState.organization.is_staff;
//     }
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(25.0),
//       child: BlocBuilder<OrganizationBloc, OrganizationState>(
//         bloc: _organizationBloc,
//         builder: (context, state) {
//           if (state is OrganizationLoadingFailureState) {
//             return ErrorPage(errorMessage: state.exception.toString());
//           }
//           if (state is OrganizationDetailLoadedState) {
//             if (state.organization != null) {
//               Organization organization = state.organization!;
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
//                                   image: AssetImage('images/organization2.png'))),
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
//                     Text(organization.getFullName(),
//                         style: theme.textTheme.headlineLarge),
//                     Text(organization.organizationname,
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
//                                   OrganizationCreateFromWidget(
//                                 organization: organization,
//                                 bloc: _organizationBloc,
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
//                                   OrganizationEditPasswordForm(
//                                 bloc: _organizationBloc,
//                                 organization: organization,
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
//                     OrganizationRoleListWidget(theme: theme, organization: organization),
//                     const SizedBox(height: 10),
//                     OrganizationProjectListWidget(theme: theme, organization: organization),
//                     const SizedBox(height: 10),
//                     OrganizationGroupListWidget(theme: theme, organization: organization),
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