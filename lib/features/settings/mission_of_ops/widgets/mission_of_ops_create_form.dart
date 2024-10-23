import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/bloc/mission_of_ops_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops.dart';
import 'package:pronet_storeroom_v_01/features/settings/mission_of_ops/repo/models/mission_of_ops_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class MissionOperationsCreateFormWidget extends StatefulWidget {
  const MissionOperationsCreateFormWidget({
    super.key,
    this.missionOperations,
    required this.bloc,
  });

  final MissionOperations? missionOperations;
  final MissionOperationsBloc bloc;
  @override
  State<MissionOperationsCreateFormWidget> createState() =>
      _MissionOperationsCreateFormWidgetState();
}

class _MissionOperationsCreateFormWidgetState
    extends State<MissionOperationsCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final MissionOperationsCreate _missionOperationsCreate =
      MissionOperationsCreate();

  @override
  void initState() {
    if (widget.missionOperations != null) {
      _missionOperationsCreate.name.text = widget.missionOperations!.name!;
      _missionOperationsCreate.description.text =
          widget.missionOperations!.description == null
              ? ''
              : widget.missionOperations!.description!;
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
            widget.missionOperations == null
                ? 'Создание цели выдачи'
                : 'Редактирование цели выдачи #${widget.missionOperations!.name}',
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
                controller: _missionOperationsCreate.name,
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
                controller: _missionOperationsCreate.description,
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
              MissionOperations? missionOperations = widget.missionOperations;

              if (missionOperations != null) {
                widget.bloc.add(EditMissionOperationsEvent(
                  id: missionOperations.id,
                  name: _missionOperationsCreate.name.text,
                  description: _missionOperationsCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewMissionOperationsEvent(
                  name: _missionOperationsCreate.name.text,
                  description: _missionOperationsCreate.description.text,
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
