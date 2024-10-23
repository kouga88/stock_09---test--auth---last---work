import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/bloc/nomenclatures_parametrs_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs_create.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

class NomenclaturesParametrsCreateFromWidget extends StatefulWidget {
  const NomenclaturesParametrsCreateFromWidget(
      {super.key, this.paramsNom, required this.bloc});

  final NomenclaturesParametrs? paramsNom;
  final NomenclaturesParametrsBloc bloc;

  @override
  State<NomenclaturesParametrsCreateFromWidget> createState() =>
      _NomenclaturesParametrsCreateFromWidgetState();
}

class _NomenclaturesParametrsCreateFromWidgetState
    extends State<NomenclaturesParametrsCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final NomenclaturesParametrsCreate _reservesCreate =
      NomenclaturesParametrsCreate();

  UnitShort? _selectetUnit;
  // bool? _selectedStatus;

  @override
  void initState() {
    if (widget.paramsNom != null) {
      _reservesCreate.name.text = widget.paramsNom!.name;
      _reservesCreate.description.text =
          widget.paramsNom!.description.toString();
      _selectetUnit = widget.paramsNom!.unit;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

    List<UnitShort> unitsList = widget.bloc.state.unitsList ?? [];

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
          widget.paramsNom == null
              ? 'Создание параметра'
              : 'Редактирование параметра ${widget.paramsNom!.name}',
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
                    const InputDecoration(labelText: 'Название параметра'),
                controller: _reservesCreate.name,
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите название параметра';
                  }
                  return null;
                },
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
                  selectedItem: _selectetUnit,
                  onChanged: (UnitShort? data) {
                    setState(() {
                      _selectetUnit = data;
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
              const SizedBox(height: 10),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Описание параметра'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _reservesCreate.description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите описание параметра';
                  }
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
              if (widget.paramsNom != null) {
                widget.bloc.add(EditNomenclaturesParametrsEvent(
                  id: widget.paramsNom!.id,
                  name: _reservesCreate.name.text,
                  description: _reservesCreate.description.text,
                  unit: _selectetUnit,
                ));
              } else {
                widget.bloc.add(CreateNewNomenclaturesParametrsEvent(
                  name: _reservesCreate.name.text,
                  description: _reservesCreate.description.text,
                  unit: _selectetUnit,
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
