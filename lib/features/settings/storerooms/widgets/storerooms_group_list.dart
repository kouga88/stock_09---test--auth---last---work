// import 'package:flutter/material.dart';
// import 'package:pronet_storeroom_v_01/features/storerooms/repo/models/storeroom.dart';
// import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';

// class StoreroomGroupListWidget extends StatelessWidget {
//   const StoreroomGroupListWidget({
//     super.key,
//     required this.theme,
//     required this.storeroom,
//   });

//   final ThemeData theme;
//   final Storeroom storeroom;

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       initiallyExpanded: true,
//       shape: theme.expansionTileTheme.shape,
//       title: Column(
//         children: [
//           Row(
//             children: [
//               Text('Группы',
//                   style: theme.textTheme.headlineMedium!
//                       .copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
//             ],
//           ),
//           const Divider(height: 7, color: Color.fromARGB(255, 109, 109, 109)),
//         ],
//       ),
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               constraints: const BoxConstraints(maxHeight: 300),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     for (Group group in storeroom.groups) Text(' - ${group.name}'),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
