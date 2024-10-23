import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/bloc/nomenclatures_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures_create.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

class NomenclaturesCreateFormWidget extends StatefulWidget {
  const NomenclaturesCreateFormWidget({
    super.key,
    this.nomenclatures,
    required this.bloc,
  });

  final Nomenclatures? nomenclatures;
  final NomenclaturesBloc bloc;
  @override
  State<NomenclaturesCreateFormWidget> createState() =>
      _NomenclaturesCreateFormWidgetState();
}

class _NomenclaturesCreateFormWidgetState
    extends State<NomenclaturesCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final NomenclaturesCreate _nomenclaturesCreate = NomenclaturesCreate();
  UnitShort? _selectedUnit;
  StoreroomShort? _selectedStoreroom;
  List<NomenclaturesGroupShort> _selectedGroups = [];

  @override
  void initState() {
    if (widget.nomenclatures != null) {
      _nomenclaturesCreate.name.text = widget.nomenclatures!.name!;
      _nomenclaturesCreate.description.text =
          widget.nomenclatures!.description == null
              ? ''
              : widget.nomenclatures!.description!;
      _selectedUnit = widget.nomenclatures!.unit;
      _selectedStoreroom = widget.nomenclatures!.storeroom;
      _selectedGroups = widget.nomenclatures!.groups!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

    List<UnitShort> unitsList = widget.bloc.state.unitsList ?? [];
    List<StoreroomShort> storeroomList = widget.bloc.state.storeroomList ?? [];
    List<NomenclaturesGroupShort> groupList = widget.bloc.state.groupList ?? [];

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
            widget.nomenclatures == null
                ? 'Создание номенклатуры'
                : 'Редактирование номенклатуры #${widget.nomenclatures!.name}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'название'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _nomenclaturesCreate.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите название';
                  }
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
                      labelText: "Cклад",
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: DropdownSearch<UnitShort>(
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
                    return unitsList
                        .where((element) => element
                            .getShortUnitName()
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (UnitShort u) {
                    return u.getShortUnitName();
                  },
                  selectedItem: _selectedUnit,
                  onChanged: (UnitShort? data) {
                    setState(() {
                      _selectedUnit = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "ед.измрения",
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 0.0),
                child: DropdownSearch<NomenclaturesGroupShort>.multiSelection(
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
                    return groupList
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (NomenclaturesGroupShort data) {
                    return data.name;
                  },
                  selectedItems: _selectedGroups,
                  onChanged: (List<NomenclaturesGroupShort>? data) {
                    _selectedGroups = data ?? [];
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "Группы",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLines: null,
                decoration: const InputDecoration(labelText: 'Описание'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _nomenclaturesCreate.description,
                validator: (value) {
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Nomenclatures? nomenclatures = widget.nomenclatures;

              if (nomenclatures != null) {
                widget.bloc.add(EditNomenclaturesEvent(
                  id: nomenclatures.id,
                  unit: _selectedUnit,
                  storeroom: _selectedStoreroom,
                  name: _nomenclaturesCreate.name.text,
                  description: _nomenclaturesCreate.description.text,
                  groups: _selectedGroups,
                ));
              } else {
                widget.bloc.add(CreateNewNomenclaturesEvent(
                  name: _nomenclaturesCreate.name.text,
                  unit: _selectedUnit,
                  storeroom: _selectedStoreroom,
                  description: _nomenclaturesCreate.description.text,
                  groups: _selectedGroups,
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
