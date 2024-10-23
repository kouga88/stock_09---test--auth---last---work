import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_short.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/form_return/repo/models/form_return.dart';

class FormUserrWidget extends StatelessWidget {
  const FormUserrWidget(
      {super.key,
      required this.userList,
      required this.setState,
      required this.formReturn});
  final FormReturn formReturn;
  final List<UserShort> userList;
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<UserShort>(
      validator: (value) {
        if (formReturn.selectedUserr == null) {
          return 'Выберите сотрудника';
        }
        return null;
      },
      compareFn: (i, s) => i.id == s.id,
      popupProps: const PopupPropsMultiSelection.menu(
        isFilterOnline: true,
        showSelectedItems: true,
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          autofocus: true,
        ),
      ),
      asyncItems: (String filter) async {
        return userList
            .where((element) => element
                .getFullName()
                .toLowerCase()
                .contains(filter.toLowerCase()))
            .toList();
      },
      itemAsString: (UserShort u) {
        return u.getFullName();
      },
      selectedItem: formReturn.selectedUserr,
      onChanged: (UserShort? data) {
        setState(() {
          formReturn.selectedUserr = data;
        });
      },
      dropdownDecoratorProps: const DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(labelText: "Ответственный"),
      ),
    );
  }
}
