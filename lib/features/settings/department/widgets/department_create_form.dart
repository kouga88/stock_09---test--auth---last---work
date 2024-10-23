import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/bloc/department_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class DepartmentCreateFormWidget extends StatefulWidget {
  const DepartmentCreateFormWidget({
    super.key,
    this.department,
    required this.bloc,
  });

  final Department? department;
  final DepartmentBloc bloc;
  @override
  State<DepartmentCreateFormWidget> createState() =>
      _DepartmentCreateFormWidgetState();
}

class _DepartmentCreateFormWidgetState
    extends State<DepartmentCreateFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final DepartmentCreate _departmentCreate = DepartmentCreate();

  @override
  void initState() {
    if (widget.department != null) {
      _departmentCreate.name.text = widget.department!.name!;
      _departmentCreate.description.text =
          widget.department!.description == null
              ? ''
              : widget.department!.description!;
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
            widget.department == null
                ? 'Создание подразделения'
                : 'Редактирование подразделения "${widget.department!.name}"',
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
                controller: _departmentCreate.name,
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
                controller: _departmentCreate.description,
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
              Department? department = widget.department;

              if (department != null) {
                widget.bloc.add(EditDepartmentEvent(
                  id: department.id,
                  name: _departmentCreate.name.text,
                  description: _departmentCreate.description.text,
                ));
              } else {
                widget.bloc.add(CreateNewDepartmentEvent(
                  name: _departmentCreate.name.text,
                  description: _departmentCreate.description.text,
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
