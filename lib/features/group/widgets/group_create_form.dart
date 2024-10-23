// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pronet_crm/features/group/block/group_bloc.dart';
// import 'package:pronet_crm/features/group/widgets/group_include_user_box.dart';
// import 'package:pronet_crm/features/group/widgets/group_user_box.dart';
// import 'package:pronet_crm/features/user/repo/models/group.dart';
// import 'package:pronet_crm/features/user/repo/models/user_short.dart';

// class GroupCreateFromWidget extends StatefulWidget {
//   const GroupCreateFromWidget(
//       {super.key, this.group, required this.bloc, required this.userList});

//   final Group? group;
//   final GroupBloc bloc;
//   final List<UserShort> userList;

//   @override
//   State<GroupCreateFromWidget> createState() => _GroupCreateFromWidgetState();
// }

// class _GroupCreateFromWidgetState extends State<GroupCreateFromWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final _lastNameController = TextEditingController();

//   @override
//   void initState() {
//     if (widget.group != null) {
//       _lastNameController.text = widget.group!.last_name;
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GroupBloc, GroupState>(
//       bloc: widget.bloc,
//       builder: (context, state) {
//         if (state is GroupListLoadedState) {
//           Group? currentGroup;
//           if (widget.group != null) {
//             for (var group in state.groupList!) {
//               if (group.id == widget.group!.id) {
//                 currentGroup = group;
//               }
//             }
//           }
//           return AlertDialog(
//             title: Text(currentGroup == null
//                 ? 'Создание группы'
//                 : 'Редактирование группы #${currentGroup.id}'),
//             content: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // last_name
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Введите наименование группы';
//                           }
//                           return null;
//                         },
//                         controller: _lastNameController,
//                         autofocus: true,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           fontFamily: 'SFProDisplay',
//                         ),
//                         keyboardType: TextInputType.multiline,
//                         decoration: const InputDecoration(
//                           contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 10),
//                           labelText: 'Наименование группы',
//                         ),
//                       ),
//                     ),

//                     const SizedBox(
//                       height: 15,
//                     ),
//                     if (currentGroup != null) ...[
//                       Row(
//                         children: [
//                           const Text(
//                             "Усастники группы",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w700,
//                               fontFamily: 'SFProDisplay',
//                             ),
//                           ),
//                           IconButton(
//                             tooltip: 'Добавить участника в группу',
//                             onPressed: () {
//                               showDialog<String>(
//                                 context: context,
//                                 builder: (BuildContext context) =>
//                                     GroupIncludeUserBoxWidget(
//                                   group: currentGroup!,
//                                   userList: widget.userList,
//                                   bloc: widget.bloc,
//                                 ),
//                               );
//                             },
//                             icon: const Icon(Icons.add, color: Colors.green),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 7,
//                       ),
//                       GroupUserBoxWidget(
//                         userList: currentGroup.users,
//                         group: currentGroup,
//                         bloc: widget.bloc,
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     Group? group = currentGroup;
//                     if (group != null) {
//                       widget.bloc.add(EditGroupEvent(
//                         id: group.id,
//                         last_name: _lastNameController.text,
//                       ));
//                     } else {
//                       widget.bloc.add(CreateNewGroupEvent(
//                         last_name: _lastNameController.text,
//                       ));
//                     }
//                     Navigator.pop(context);
//                   }
//                 },
//                 child: const Text('Сохранить'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text('Отмена'),
//               ),
//             ],
//           );
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
