// import 'dart:async';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:pronet_crm/common/pages/error_page.dart';
// import 'package:pronet_crm/features/auth/bloc/auth_bloc.dart';
// import 'package:pronet_crm/features/group/block/group_bloc.dart';
// import 'package:pronet_crm/features/group/widgets/group_create_form.dart';
// import 'package:pronet_crm/features/group/widgets/group_list_table.dart';
// import 'package:pronet_crm/features/user/repo/user_repo.dart';

// @RoutePage()
// class GroupListPage extends StatefulWidget {
//   const GroupListPage({super.key});

//   @override
//   State<GroupListPage> createState() => _GroupListPageState();
// }

// class _GroupListPageState extends State<GroupListPage> {
//   final GroupBloc _groupBloc = GroupBloc(GetIt.I<UserRepo>());
//   final authBloc = GetIt.I<AuthBloc>();

//   Future<void> refreshList() {
//     final completer = Completer();
//     _groupBloc.add(LoadGroupListEvent(
//         completer: completer, 
//       ));
//     return completer.future;
//   }

//   @override
//   void initState() {
//     _groupBloc.add(LoadGroupListEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     if (authBloc.state is AuthSuccessedState) {
//       final authState = (authBloc.state as AuthSuccessedState);
//       if (!authState.user.isAdmin) {
//         return const Center(
//           child: Text("Доступ закрыт"),
//         );
//       }
//     }
//     return RefreshIndicator(
//       onRefresh: () async {
//         return refreshList();
//       },
//       child: BlocBuilder<GroupBloc, GroupState>(
//         bloc: _groupBloc,
//         builder: (context, state) {
//           if (state is GroupListLoadedState) {
//             return SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Группы',
//                           style: theme.textTheme.headlineLarge,
//                         ),
//                         const SizedBox(
//                           width: 7,
//                         ),
//                         IconButton(
//                           onPressed: () {
//                             showDialog<String>(
//                               context: context,
//                               builder: (BuildContext context) =>
//                               GroupCreateFromWidget(
//                                     bloc: _groupBloc,
//                                     userList: state.userList??[],
//                               ),
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.group_add,
//                             color: Colors.green,
//                             size: 26,
//                           ),
//                         ), 
//                       ],
//                     ),
//                     GroupListTableWidget(groupList: state.groupList??[], groupBloc: _groupBloc, userList: state.userList??[],),
//                   ],
//                 ),
//               ),
//             );
//           }
//           if (state is GroupListLoadingFailureState) {
//               return ErrorPage(errorMessage: state.exception.toString());
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }


