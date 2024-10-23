import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/bloc/type_of_work_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work.dart';
import 'package:pronet_storeroom_v_01/features/settings/type_of_work/repo/models/type_of_work_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class TypeWorkCreateFormWidget extends StatefulWidget {
  const TypeWorkCreateFormWidget({
    super.key,
    this.typeWork,
    required this.bloc,
  });

  final TypeWork? typeWork;
  final TypeWorkBloc bloc;
  @override
  State<TypeWorkCreateFormWidget> createState() =>
      _TypeWorkCreateFormWidgetState();
}

class _TypeWorkCreateFormWidgetState extends State<TypeWorkCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TypeWorkCreate _typeWorkCreate = TypeWorkCreate();

  @override
  void initState() {
    if (widget.typeWork != null) {
      _typeWorkCreate.name.text = widget.typeWork!.name!;
      _typeWorkCreate.description.text = widget.typeWork!.description == null
          ? ''
          : widget.typeWork!.description!;
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
            widget.typeWork == null
                ? 'Создание типа работ'
                : 'Редактирование типа работ "${widget.typeWork!.name}"',
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
                controller: _typeWorkCreate.name,
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
                controller: _typeWorkCreate.description,
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
              TypeWork? typeWork = widget.typeWork;

              if (typeWork != null) {
                widget.bloc.add(EditTypeWorkEvent(
                  id: typeWork.id,
                  name: _typeWorkCreate.name.text,
                  description: _typeWorkCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewTypeWorkEvent(
                  name: _typeWorkCreate.name.text,
                  description: _typeWorkCreate.description.text,
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
