// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:pronet_storeroom_v_01/features/settings/reserves/bloc/reserves_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
// import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves_create.dart';
// import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storeroom_short.dart';
// import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
// import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

// class ReservesCreateFromWidget extends StatefulWidget {
//   const ReservesCreateFromWidget(
//       {super.key, this.reserves, required this.bloc});

//   final Reserves? reserves;
//   final ReservesBloc bloc;
//   @override
//   State<ReservesCreateFromWidget> createState() =>
//       _ReservesCreateFromWidgetState();
// }

// class _ReservesCreateFromWidgetState extends State<ReservesCreateFromWidget> {
//   final _formKey = GlobalKey<FormState>();
//   final ReservesCreate _reservesCreate = ReservesCreate();

//   StoreroomShort? _selectedStoreroom;
//   bool? _selectedStatus;
//   @override
//   void initState() {
//     if (widget.reserves != null) {
//       _reservesCreate.name.text = widget.reserves!.name;
//       _reservesCreate.description.text =
//           widget.reserves!.description.toString();
//       _selectedStoreroom = widget.reserves!.storeroom;
//       _selectedStatus = widget.reserves!.status;
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
//     final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

//     List<StoreroomShort> storeroomList = widget.bloc.state.storeroomList ?? [];
//     List<bool> status = [false, true];

//     return AlertDialog(
//       scrollable: true,
//       title: SizedBox(
//         width: 600,
//         child: Text(
//             widget.reserves == null
//                 ? 'Создание резерва'
//                 : 'Редактирование резерва ${widget.reserves!.name}',
//             style: theme.textTheme.headlineSmall),
//       ),
//       content: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Название резерва'),
//                 controller: _reservesCreate.name,
//                 autofocus: true,
//                 validator: (value) {
//                   if (value == null) {
//                     return 'введите название резерва';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 decoration: const InputDecoration(labelText: 'Описание резерва'),
//                 keyboardType: TextInputType.multiline,
//                 autofocus: true,
//                 controller: _reservesCreate.description,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'введите описание резерва';
//                   }
//                   return null;
//                 },
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
//                 child: DropdownSearch<StoreroomShort>(
//                   compareFn: (i, s) => i.id == s.id,
//                   popupProps: const PopupPropsMultiSelection.menu(
//                     isFilterOnline: true,
//                     showSelectedItems: true,
//                     showSearchBox: true,
//                     searchFieldProps: TextFieldProps(
//                       autofocus: true,
//                     ),
//                   ),
//                   asyncItems: (String filter) async {
//                     return storeroomList
//                         .where((element) => element
//                             .getName()
//                             .toLowerCase()
//                             .contains(filter.toLowerCase()))
//                         .toList();
//                   },
//                   itemAsString: (StoreroomShort u) {
//                     return u.getName();
//                   },
//                   selectedItem: _selectedStoreroom,
//                   onChanged: (StoreroomShort? data) {
//                     setState(() {
//                       _selectedStoreroom = data;
//                     });
//                   },
//                   dropdownDecoratorProps: DropDownDecoratorProps(
//                     baseStyle: dropDownTheme?.dropDownText,
//                     dropdownSearchDecoration:
//                         const InputDecoration(labelText: "Склады"),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
//                 child: DropdownSearch<StoreroomShort>(
//                   compareFn: (i, s) => i.id == s.id,
//                   popupProps: const PopupPropsMultiSelection.menu(
//                     isFilterOnline: true,
//                     showSelectedItems: true,
//                     searchFieldProps: TextFieldProps(
//                       autofocus: true,
//                     ),
//                   ),
//                   asyncItems: (String filter) async {
//                     // Предположим, что статус — это массив типа [false, true]
//                     // Фильтруем элементы по какому-то критерию, если требуется
//                     var filteredStatus = status
//                         .where((element) =>
//                             element.toString().contains(filter)) // фильтрация
//                         .toList();

//                     // Возвращаем список объектов типа StoreroomShort
//                     return filteredStatus
//                         .map((e) => bool(id: e ? 1 : 0, name: e.toString()))
//                         .toList();
//                   },
//                   itemAsString: (bool u) {
//                     return u; // Метод, который возвращает имя
//                   },
//                   selectedItem: _selectedStatus,
//                   onChanged: (bool? data) {
//                     setState(() {
//                       _selectedStatus = data;
//                     });
//                   },
//                   dropdownDecoratorProps: DropDownDecoratorProps(
//                     baseStyle: dropDownTheme?.dropDownText,
//                     dropdownSearchDecoration:
//                         const InputDecoration(labelText: "Статус"),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       actions: <Widget>[
//         ElevatedButton(
//           onPressed: () {
//             Reserves? reserves = widget.reserves;
//             if (_formKey.currentState!.validate()) {
//               Reserves? reserves = widget.reserves;
//               // int? telegramId = int.tryParse(_reservesCreate.telegram_id.text);

//               if (reserves != null) {
//                 widget.bloc.add(EditReservesEvent(
//                     id: reserves.id,
//                     name: _reservesCreate.name.text,
//                     description: _reservesCreate.description.text,
//                     storeroom: _selectedStoreroom));
//               } else {
//                 widget.bloc.add(CreateNewReservesEvent(
//                   name: _reservesCreate.name.text,
//                   description: _reservesCreate.description.text,
//                   storeroom: _selectedStoreroom,
//                 ));
//               }
//               Navigator.pop(context);
//             }
//           },
//           child: const Text(
//             'Сохранить',
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () => Navigator.pop(context),
//           style: buttonsTheme.secondaryButton,
//           child: const Text(
//             'Отмена',
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/bloc/reserves_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves_create.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

class ReservesCreateFromWidget extends StatefulWidget {
  const ReservesCreateFromWidget(
      {super.key, this.reserves, required this.bloc});

  final Reserves? reserves;
  final ReservesBloc bloc;

  @override
  State<ReservesCreateFromWidget> createState() =>
      _ReservesCreateFromWidgetState();
}

class _ReservesCreateFromWidgetState extends State<ReservesCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final ReservesCreate _reservesCreate = ReservesCreate();

  StoreroomShort? _selectedStoreroom;
  bool? _selectedStatus;

  @override
  void initState() {
    if (widget.reserves != null) {
      _reservesCreate.name.text = widget.reserves!.name;
      _reservesCreate.description.text =
          widget.reserves!.description.toString();
      _selectedStoreroom = widget.reserves!.storeroom;
      _selectedStatus = widget.reserves!.status;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

    List<StoreroomShort> storeroomList = widget.bloc.state.storeroomList ?? [];
    List<bool> statusList = [false, true];

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
          widget.reserves == null
              ? 'Создание резерва'
              : 'Редактирование резерва ${widget.reserves!.name}',
          style: theme.textTheme.headlineSmall,
        ),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Название резерва'),
                controller: _reservesCreate.name,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите название резерва';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Описание резерва'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _reservesCreate.description,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'введите описание резерва';
                  // }
                  return null;
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: DropdownSearch<StoreroomShort>(
                  compareFn: (i, s) => i.id == s.id,
                  popupProps: const PopupPropsMultiSelection.menu(
                    isFilterOnline: true,
                    showSelectedItems: true,
                    showSearchBox: false,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                    ),
                  ),
                  asyncItems: (String filter) async {
                    return storeroomList
                        .where((element) => element
                            .getName()
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (StoreroomShort u) {
                    return u.getName();
                  },
                  selectedItem: _selectedStoreroom,
                  onChanged: (StoreroomShort? data) {
                    setState(() {
                      _selectedStoreroom = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "Склад",
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: DropdownSearch<bool>(
                  compareFn: (i, s) => i == s,
                  popupProps: const PopupPropsMultiSelection.menu(
                    isFilterOnline: false,
                    showSelectedItems: true,
                  ),
                  items: statusList,
                  itemAsString: (bool status) {
                    return status ? "Активный" : "Неактивный";
                  },
                  selectedItem: _selectedStatus,
                  onChanged: (bool? data) {
                    setState(() {
                      _selectedStatus = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "Статус",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (widget.reserves != null) {
                widget.bloc.add(EditReservesEvent(
                  id: widget.reserves!.id,
                  name: _reservesCreate.name.text,
                  description: _reservesCreate.description.text,
                  storeroom: _selectedStoreroom,
                  status: _selectedStatus,
                ));
              } else {
                widget.bloc.add(CreateNewReservesEvent(
                  name: _reservesCreate.name.text,
                  description: _reservesCreate.description.text,
                  storeroom: _selectedStoreroom,
                  status: _selectedStatus,
                ));
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Сохранить'),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: buttonsTheme.secondaryButton,
          child: const Text('Отмена'),
        ),
      ],
    );
  }
}
