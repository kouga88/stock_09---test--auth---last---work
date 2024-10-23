// import 'package:flutter/material.dart';
// import 'package:pronet_crm/features/group/block/group_bloc.dart';
// import 'package:pronet_crm/features/user/repo/models/group.dart';
// import 'package:pronet_crm/features/user/repo/models/user_short.dart';

// class GroupUserBoxWidget extends StatelessWidget {
//   const GroupUserBoxWidget({
//     super.key,
//     required this.userList,
//     required this.group,
//     required this.bloc,
//   });

//   final Group group;
//   final List<UserShort> userList;
//   final GroupBloc bloc;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (int i = 0; i < userList.length; i++)
//           ListTile(
//             leading: Text(userList[i].id.toString()),
//             title: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   userList[i].getFullName(),
//                   style: const TextStyle(
//                     fontSize: 12,
//                     fontFamily: 'SFProDisplay',
//                   ),
//                 ),
//               ],
//             ),
//             trailing: IconButton(
//               icon: const Icon(
//                 Icons.remove_done,
//                 color: Color(0xffe62e2e),
//                 size: 12,
//               ),
//               tooltip: 'Исключить из группы',
//               onPressed: () async {
//                 final result = await showDialog<bool>(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: const Text('Вы уверены?'),
//                     content: Text(
//                         'Вы уверены что хотите исключить пользователя #${userList[i].id} из группы #${group.id}?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, false),
//                         child: const Text('Отмена'),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, true),
//                         child: const Text('Удалить'),
//                       ),
//                     ],
//                   ),
//                 );
//                 if (result == null || !result) {
//                   return;
//                 }
//                 bloc.add(
//                     ExcludeUserEvent(id: group.id, userId: userList[i].id));
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }
