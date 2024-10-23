// import 'package:flutter/material.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:pronet_storeroom_v_01/features/storerooms/repo/models/storeroom_list_filters.dart';
// import 'package:pronet_storeroom_v_01/features/users/repo/models/user_list_filters.dart';

// class StoreroomListFiltersBoxWidget extends StatefulWidget {
//   const StoreroomListFiltersBoxWidget({
//     super.key,
//     required this.refreshList,
//   });

//   final Function refreshList;
//   // final StoreroomrsListFilters filters;

//   @override
//   State<StoreroomListFiltersBoxWidget> createState() =>
//       _StoreroomListFiltersBoxWidgetState();
// }

// class _StoreroomListFiltersBoxWidgetState extends State<StoreroomListFiltersBoxWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Фильтры',
//               style: TextStyle(
//                   fontFamily: 'SFProDisplay', fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             // фильтр - is_staff
//             DropdownSearch<String>(
//               popupProps: const PopupPropsMultiSelection.menu(
//                 showSelectedItems: true,
//               ),
//               asyncItems: (String filter) async {
//                 return ['Не задано', 'Нет', 'Да'];
//               },
//               selectedItem: widget.filters.is_staff == null
//                   ? 'Не задано'
//                   : (widget.filters.is_staff! ? 'Да' : 'Нет'),
//               onChanged: (String? data) {
//                 widget.filters.is_staff =
//                     data == 'Не задано' ? null : (data == 'Нет' ? false : true);
//                 widget.refreshList();
//               },
//               dropdownDecoratorProps: const DropDownDecoratorProps(
//                 dropdownSearchDecoration:
//                     InputDecoration(labelText: "Администратор"),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // фильтр - is_active
//             DropdownSearch<String>(
//               popupProps: const PopupPropsMultiSelection.menu(
//                 showSelectedItems: true,
//               ),
//               asyncItems: (String filter) async {
//                 return ['Не задано', 'Нет', 'Да'];
//               },
//               selectedItem: widget.filters.is_active == null
//                   ? 'Не задано'
//                   : (widget.filters.is_active! ? 'Да' : 'Нет'),
//               onChanged: (String? data) {
//                 widget.filters.is_active =
//                     data == 'Не задано' ? null : (data == 'Нет' ? false : true);
//                 widget.refreshList();
//               },
//               dropdownDecoratorProps: const DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(labelText: "Активен"),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             // фильтр - is_superuser
//             DropdownSearch<String>(
//               popupProps: const PopupPropsMultiSelection.menu(
//                 showSelectedItems: true,
//               ),
//               asyncItems: (String filter) async {
//                 return ['Не задано', 'Нет', 'Да'];
//               },
//               selectedItem: widget.filters.is_superuser == null
//                   ? 'Не задано'
//                   : (widget.filters.is_superuser! ? 'Да' : 'Нет'),
//               onChanged: (String? data) {
//                 widget.filters.is_superuser =
//                     data == 'Не задано' ? null : (data == 'Нет' ? false : true);
//                 widget.refreshList();
//               },
//               dropdownDecoratorProps: const DropDownDecoratorProps(
//                 dropdownSearchDecoration:
//                     InputDecoration(labelText: "Супер пользователь"),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
