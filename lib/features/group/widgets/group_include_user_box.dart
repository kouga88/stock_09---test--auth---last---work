// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:pronet_crm/features/group/block/group_bloc.dart';
// import 'package:pronet_crm/features/user/repo/models/group.dart';
// import 'package:pronet_crm/features/user/repo/models/user_short.dart';

// class GroupIncludeUserBoxWidget extends StatefulWidget {
//   const GroupIncludeUserBoxWidget(
//       {super.key,
//       required this.group,
//       required this.bloc,
//       required this.userList});

//   final Group group;
//   final GroupBloc bloc;
//   final List<UserShort> userList;

//   @override
//   State<GroupIncludeUserBoxWidget> createState() =>
//       _GroupIncludeUserBoxWidgetState();
// }

// class _GroupIncludeUserBoxWidgetState extends State<GroupIncludeUserBoxWidget> {
//   final _formKey = GlobalKey<FormState>();
//   UserShort? _selectedUser;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Добавление пользователя в группу'),
//       content: Form(
//         key: _formKey,
//         child: DropdownSearch<UserShort>(
//           validator: (value) {
//             if (_selectedUser == null) {
//               return 'Выберите пользователя';
//             }
//             return null;
//           },
//           compareFn: (i, s) => i.id == s.id,
//           popupProps: const PopupPropsMultiSelection.menu(
//             isFilterOnline: true,
//             showSelectedItems: true,
//             showSearchBox: true,
//             searchFieldProps: TextFieldProps(
//               autofocus: true,
//             ),
//           ),
//           asyncItems: (String filter) async {
//             return widget.userList
//                 .where((element) => element
//                     .getFullName()
//                     .toLowerCase()
//                     .contains(filter.toLowerCase()))
//                 .toList();
//           },
//           itemAsString: (UserShort u) {
//             return u.getFullName();
//           },
//           selectedItem: _selectedUser,
//           onChanged: (UserShort? data) {
//             setState(() {
//               _selectedUser = data;
//             });
//           },
//           dropdownDecoratorProps: const DropDownDecoratorProps(
//             dropdownSearchDecoration:
//                 InputDecoration(labelText: "Выбранный пользователь"),
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate() && _selectedUser != null) {
//               widget.bloc.add(IncludeUserEvent(
//                 id: widget.group.id,
//                 userId: _selectedUser!.id,
//               ));
//               Navigator.pop(context);
//             }
//           },
//           child: const Text('Сохранить'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Отмена'),
//         ),
//       ],
//     );
//   }
// }
