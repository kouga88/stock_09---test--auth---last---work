import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/bloc/type_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_ops/repo/models/type_of_ops_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class TypeOpsCreateFormWidget extends StatefulWidget {
  const TypeOpsCreateFormWidget({
    super.key,
    this.typeOps,
    required this.bloc,
  });

  final TypeOps? typeOps;
  final TypeOpsBloc bloc;
  @override
  State<TypeOpsCreateFormWidget> createState() =>
      _TypeOpsCreateFormWidgetState();
}

class _TypeOpsCreateFormWidgetState extends State<TypeOpsCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TypeOpsCreate _typeOpsCreate = TypeOpsCreate();

  @override
  void initState() {
    if (widget.typeOps != null) {
      _typeOpsCreate.name.text = widget.typeOps!.name!;
      _typeOpsCreate.description.text = widget.typeOps!.description == null
          ? ''
          : widget.typeOps!.description!;
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
            widget.typeOps == null
                ? 'Создание тип операции'
                : 'Редактирование тип операции #${widget.typeOps!.name}',
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
                controller: _typeOpsCreate.name,
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
                controller: _typeOpsCreate.description,
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
              TypeOps? typeOps = widget.typeOps;

              if (typeOps != null) {
                widget.bloc.add(EditTypeOpsEvent(
                  id: typeOps.id,
                  name: _typeOpsCreate.name.text,
                  description: _typeOpsCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewTypeOpsEvent(
                  name: _typeOpsCreate.name.text,
                  description: _typeOpsCreate.description.text,
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
