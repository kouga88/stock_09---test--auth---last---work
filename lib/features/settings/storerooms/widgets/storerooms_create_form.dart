import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:pronet_storeroom_v_01/features/settings/storerooms/bloc/storerooms_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_create.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

class StoreroomCreateFromWidget extends StatefulWidget {
  const StoreroomCreateFromWidget(
      {super.key, this.storeroom, required this.bloc});

  final Storeroom? storeroom;
  final StoreroomBloc bloc;
  @override
  State<StoreroomCreateFromWidget> createState() =>
      _StoreroomCreateFromWidgetState();
}

class _StoreroomCreateFromWidgetState extends State<StoreroomCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final StoreroomCreate _storeroomCreate = StoreroomCreate();

  OrganizationShort? _selectedOrg;

  @override
  void initState() {
    if (widget.storeroom != null) {
      _storeroomCreate.name.text = widget.storeroom!.name;
      _storeroomCreate.description.text =
          widget.storeroom!.description.toString();
      _selectedOrg = OrganizationShort(
          id: widget.storeroom!.organization.id,
          name: widget.storeroom!.organization.name);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

    List<OrganizationShort> orgList = widget.bloc.state.orgList ?? [];

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
            widget.storeroom == null
                ? 'Создание склада'
                : 'Редактирование склада ${widget.storeroom!.name}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Название склада'),
                controller: _storeroomCreate.name,
                autofocus: true,
                validator: (value) {
                  if (value == null) {
                    return 'введите название склада';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Описание склада'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _storeroomCreate.description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите описание склада';
                  }
                  return null;
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: DropdownSearch<OrganizationShort>(
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
                    return orgList
                        .where((element) => element
                            .getOrganizationsName()
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (OrganizationShort u) {
                    return u.getOrganizationsName();
                  },
                  selectedItem: _selectedOrg,
                  onChanged: (OrganizationShort? data) {
                    setState(() {
                      _selectedOrg = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration:
                        const InputDecoration(labelText: "Организации"),
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
              Storeroom? storeroom = widget.storeroom;
              if (storeroom != null) {
                widget.bloc.add(EditStoreroomEvent(
                  id: storeroom.id,
                  name: _storeroomCreate.name.text,
                  description: _storeroomCreate.description.text,
                  organization: _selectedOrg != null
                      ? _selectedOrg!.name
                      : widget.storeroom!.organization.name,
                ));
              } else {
                widget.bloc.add(CreateNewStoreroomEvent(
                  name: _storeroomCreate.name.text,
                  description: _storeroomCreate.description.text,
                  organization: _selectedOrg != null ? _selectedOrg!.name : '',
                ));
              }
              Navigator.pop(context);
            }
          },
          child: const Text(
            'Сохранить',
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: buttonsTheme.secondaryButton,
          child: const Text(
            'Отмена',
          ),
        ),
      ],
    );
  }
}
