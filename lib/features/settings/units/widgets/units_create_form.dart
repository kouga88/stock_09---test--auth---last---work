import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/bloc/units_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class UnitsCreateFromWidget extends StatefulWidget {
  const UnitsCreateFromWidget({super.key, this.units, required this.bloc});

  final Units? units;
  final UnitsBloc bloc;
  @override
  State<UnitsCreateFromWidget> createState() => _UnitsCreateFromWidgetState();
}

class _UnitsCreateFromWidgetState extends State<UnitsCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final UnitCreate _unitsCreate = UnitCreate();

  @override
  void initState() {
    if (widget.units != null) {
      _unitsCreate.full_name.text = widget.units!.full_name!;
      _unitsCreate.short_name.text = widget.units!.short_name!;
      _unitsCreate.description.text =
          widget.units!.description == null ? '' : widget.units!.description!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
            widget.units == null
                ? 'Создание единицы измерения'
                : 'Редактирование единицы измерения #${widget.units!.full_name}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'полное наименование'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _unitsCreate.full_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите полное наименование';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Обозначение'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _unitsCreate.short_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите Обозначение';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: null,
                decoration: const InputDecoration(labelText: 'Описание'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _unitsCreate.description,
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
              Units? units = widget.units;

              if (units != null) {
                widget.bloc.add(EditUnitsEvent(
                  id: units.id,
                  full_name: _unitsCreate.full_name.text,
                  short_name: _unitsCreate.short_name.text,
                  description: _unitsCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewUnitsEvent(
                  full_name: _unitsCreate.full_name.text,
                  short_name: _unitsCreate.short_name.text,
                  description: _unitsCreate.description.text,
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
