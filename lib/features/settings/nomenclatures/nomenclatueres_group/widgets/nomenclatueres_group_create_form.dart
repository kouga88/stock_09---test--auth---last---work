import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/bloc/nomenclatueres_group_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatueres_group/repo/models/nomenclatueres_group_create.dart';

import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class NomenclaturesGroupCreateFormWidget extends StatefulWidget {
  const NomenclaturesGroupCreateFormWidget({
    super.key,
    this.nomenclaturesGroup,
    required this.bloc,
  });

  final NomenclaturesGroup? nomenclaturesGroup;
  final NomenclaturesGroupBloc bloc;
  @override
  State<NomenclaturesGroupCreateFormWidget> createState() =>
      _NomenclaturesGroupCreateFormWidgetState();
}

class _NomenclaturesGroupCreateFormWidgetState
    extends State<NomenclaturesGroupCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final NomenclaturesGroupCreate _nomenclaturesGroupCreate =
      NomenclaturesGroupCreate();

  @override
  void initState() {
    if (widget.nomenclaturesGroup != null) {
      _nomenclaturesGroupCreate.name.text = widget.nomenclaturesGroup!.name!;
      _nomenclaturesGroupCreate.description.text =
          widget.nomenclaturesGroup!.description == null
              ? ''
              : widget.nomenclaturesGroup!.description!;
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
            widget.nomenclaturesGroup == null
                ? 'Создание группы номенклатуры'
                : 'Редактирование группы номенклатуры #${widget.nomenclaturesGroup!.name}',
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
                controller: _nomenclaturesGroupCreate.name,
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
                controller: _nomenclaturesGroupCreate.description,
                validator: (value) {
                  // if (value == null || value.isEmpty) {
                  //   return 'введите описание';
                  // }
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
              NomenclaturesGroup? nomenclaturesGroup =
                  widget.nomenclaturesGroup;

              if (nomenclaturesGroup != null) {
                widget.bloc.add(EditNomenclaturesGroupEvent(
                  id: nomenclaturesGroup.id,
                  name: _nomenclaturesGroupCreate.name.text,
                  description: _nomenclaturesGroupCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewNomenclaturesGroupEvent(
                  name: _nomenclaturesGroupCreate.name.text,
                  description: _nomenclaturesGroupCreate.description.text,
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
