import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/bloc/organization_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class OrganizationCreateFromWidget extends StatefulWidget {
  const OrganizationCreateFromWidget(
      {super.key, this.organization, required this.bloc});

  final Organization? organization;
  final OrganizationBloc bloc;
  @override
  State<OrganizationCreateFromWidget> createState() =>
      _OrganizationCreateFromWidgetState();
}

class _OrganizationCreateFromWidgetState
    extends State<OrganizationCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final OrganizationCreate _organizationCreate = OrganizationCreate();

  @override
  void initState() {
    if (widget.organization != null) {
      _organizationCreate.name.text = widget.organization!.name!;
      _organizationCreate.description.text =
          widget.organization!.description == null
              ? ''
              : widget.organization!.description!;
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
            widget.organization == null
                ? 'Создание организации'
                : 'Редактирование организации #${widget.organization!.name}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Название'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _organizationCreate.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите назавание';
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
                controller: _organizationCreate.description,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите описание';
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
              Organization? organization = widget.organization;

              if (organization != null) {
                widget.bloc.add(EditOrganizationEvent(
                  id: organization.id,
                  name: _organizationCreate.name.text,
                  description: _organizationCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewOrganizationEvent(
                  name: _organizationCreate.name.text,
                  description: _organizationCreate.description.text,
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
