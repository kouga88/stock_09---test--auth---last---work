// import 'package:flutter/material.dart';
// import 'package:pronet_crm/features/group/block/group_bloc.dart';
// import 'package:pronet_crm/features/group/widgets/group_create_form.dart';
// import 'package:pronet_crm/features/user/repo/models/group.dart';
// import 'package:pronet_crm/features/user/repo/models/user_short.dart';

// class GroupListTableWidget extends StatelessWidget {
//   const GroupListTableWidget({
//     super.key,
//     required this.groupList,
//     required GroupBloc groupBloc,
//     required this.userList,
//   }) : _groupBloc = groupBloc;

//   final List<Group> groupList;
//   final GroupBloc _groupBloc;
//   final List<UserShort> userList;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Column(
//       children: [
//         for (int i = 0; i < groupList.length; i++)
//           InkWell(
//             onDoubleTap: () {
//               showDialog<String>(
//                 context: context,
//                 builder: (BuildContext context) => GroupCreateFromWidget(
//                   bloc: _groupBloc,
//                   group: groupList[i],
//                   userList: userList,
//                 ),
//               );
//             },
//             child: ListTile(
//               leading: Text(groupList[i].id.toString()),
//               title: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(groupList[i].last_name),
//                   SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Text(
//                         'Пользователей: ${groupList[i].getUserCount()}',
//                         style: theme.textTheme.headlineSmall!
//                             .copyWith(fontSize: 9),
//                       )),
//                 ],
//               ),
//               trailing: SizedBox(
//                 width: 100,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(
//                         Icons.edit,
//                         color: Colors.blue,
//                         size: 17,
//                       ),
//                       onPressed: () async {
//                         showDialog<String>(
//                           context: context,
//                           builder: (BuildContext context) =>
//                               GroupCreateFromWidget(
//                             bloc: _groupBloc,
//                             group: groupList[i],
//                             userList: userList,
//                           ),
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(
//                         Icons.delete,
//                         color: Color(0xffe62e2e),
//                         size: 17,
//                       ),
//                       onPressed: () async {
//                         final result = await showDialog<bool>(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text('Вы уверены?'),
//                             content: Text(
//                                 'Вы уверены что хотите удалить пользователя #${groupList[i].id}?'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context, false),
//                                 child: const Text('Отмена'),
//                               ),
//                               TextButton(
//                                 onPressed: () => Navigator.pop(context, true),
//                                 child: const Text('Удалить'),
//                               ),
//                             ],
//                           ),
//                         );
//                         if (result == null || !result) {
//                           return;
//                         }
//                         _groupBloc.add(DeleteGroupEvent(id: groupList[i].id));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
