import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/bloc/directions_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/directions_of_ops/repo/models/directions_of_ops_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class DirectionsOpsCreateFormWidget extends StatefulWidget {
  const DirectionsOpsCreateFormWidget({
    super.key,
    this.directionsOps,
    required this.bloc,
  });

  final DirectionsOps? directionsOps;
  final DirectionsOpsBloc bloc;
  @override
  State<DirectionsOpsCreateFormWidget> createState() =>
      _DirectionsOpsCreateFormWidgetState();
}

class _DirectionsOpsCreateFormWidgetState
    extends State<DirectionsOpsCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final DirectionsOpsCreate _directionsOpsCreate = DirectionsOpsCreate();

  @override
  void initState() {
    if (widget.directionsOps != null) {
      _directionsOpsCreate.name.text = widget.directionsOps!.name!;
      _directionsOpsCreate.description.text =
          widget.directionsOps!.description == null
              ? ''
              : widget.directionsOps!.description!;
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
            widget.directionsOps == null
                ? 'Создание направления расхода'
                : 'Редактирование направления расхода #${widget.directionsOps!.name}',
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
                controller: _directionsOpsCreate.name,
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
                controller: _directionsOpsCreate.description,
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
              DirectionsOps? directionsOps = widget.directionsOps;

              if (directionsOps != null) {
                widget.bloc.add(EditDirectionsOpsEvent(
                  id: directionsOps.id,
                  name: _directionsOpsCreate.name.text,
                  description: _directionsOpsCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewDirectionsOpsEvent(
                  name: _directionsOpsCreate.name.text,
                  description: _directionsOpsCreate.description.text,
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
