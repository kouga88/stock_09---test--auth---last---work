import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/bloc/building_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building.dart';
import 'package:pronet_storeroom_v_01/features/settings/building/repo/models/building_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class BuildingCreateFormWidget extends StatefulWidget {
  const BuildingCreateFormWidget({
    super.key,
    this.building,
    required this.bloc,
  });

  final Building? building;
  final BuildingBloc bloc;
  @override
  State<BuildingCreateFormWidget> createState() =>
      _BuildingCreateFormWidgetState();
}

class _BuildingCreateFormWidgetState extends State<BuildingCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final BuildingCreate _buildingCreate = BuildingCreate();

  @override
  void initState() {
    if (widget.building != null) {
      _buildingCreate.name.text = widget.building!.name!;
      _buildingCreate.description.text = widget.building!.description == null
          ? ''
          : widget.building!.description!;
      _buildingCreate.status = widget.building!.status!;
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
            widget.building == null
                ? 'Создание строительного объекта'
                : 'строительного объекта "${widget.building!.name}"',
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
                controller: _buildingCreate.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите название';
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
                controller: _buildingCreate.description,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'введите описание';
                  // }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: _buildingCreate.status,
                      onChanged: (bool? value) {
                        setState(() {
                          _buildingCreate.status = value!;
                        });
                      },
                    ),
                    Text(
                      'Показывать в списках выбора.',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
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
              Building? building = widget.building;

              if (building != null) {
                widget.bloc.add(EditBuildingEvent(
                  id: building.id,
                  name: _buildingCreate.name.text,
                  description: _buildingCreate.description.text,
                  status: _buildingCreate.status,
                ));
              } else {
                widget.bloc.add(CreateNewBuildingEvent(
                  name: _buildingCreate.name.text,
                  description: _buildingCreate.description.text,
                  status: _buildingCreate.status,
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
