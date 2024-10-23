import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/bloc/suppliers_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class SuppliersCreateFormWidget extends StatefulWidget {
  const SuppliersCreateFormWidget({
    super.key,
    this.suppliers,
    required this.bloc,
  });

  final Suppliers? suppliers;
  final SuppliersBloc bloc;
  @override
  State<SuppliersCreateFormWidget> createState() =>
      _SuppliersCreateFormWidgetState();
}

class _SuppliersCreateFormWidgetState extends State<SuppliersCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final SuppliersCreate _suppliersCreate = SuppliersCreate();

  @override
  void initState() {
    if (widget.suppliers != null) {
      _suppliersCreate.name.text = widget.suppliers!.name!;
      _suppliersCreate.description.text = widget.suppliers!.description == null
          ? ''
          : widget.suppliers!.description!;
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
            widget.suppliers == null
                ? 'Создание поставщика'
                : 'Редактирование поставщика "{widget.suppliers!.name}"',
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
                controller: _suppliersCreate.name,
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
                controller: _suppliersCreate.description,
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
              Suppliers? suppliers = widget.suppliers;

              if (suppliers != null) {
                widget.bloc.add(EditSuppliersEvent(
                  id: suppliers.id,
                  name: _suppliersCreate.name.text,
                  description: _suppliersCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewSuppliersEvent(
                  name: _suppliersCreate.name.text,
                  description: _suppliersCreate.description.text,
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
