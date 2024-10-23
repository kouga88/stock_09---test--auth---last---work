import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization_short.dart';
import 'package:pronet_storeroom_v_01/features/settings/department/repo/models/department_short.dart';
import 'package:pronet_storeroom_v_01/features/users/bloc/user_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/group.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user_create.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/dropdown_text_theme.dart';

class UserCreateFromWidget extends StatefulWidget {
  const UserCreateFromWidget({super.key, this.user, required this.bloc});

  final User? user;
  final UserBloc bloc;
  @override
  State<UserCreateFromWidget> createState() => _UserCreateFromWidgetState();
}

class _UserCreateFromWidgetState extends State<UserCreateFromWidget> {
  final _formKey = GlobalKey<FormState>();
  final UserCreate _userCreate = UserCreate();
  bool _isShowPasswordInputText = false;
  List<Group> _selectedGroups = [];
  OrganizationShort? _selectedOrg;
  DepartmentShort? _selectedDept;

  @override
  void initState() {
    if (widget.user != null) {
      _userCreate.first_name.text = widget.user!.first_name;
      _userCreate.last_name.text = widget.user!.last_name;
      _userCreate.surname.text = widget.user!.surname ?? '';
      _userCreate.email.text = widget.user!.email ?? '';
      _userCreate.username.text = widget.user!.username;
      _userCreate.is_staff = widget.user!.is_staff;
      _userCreate.is_superuser = widget.user!.is_superuser;
      _userCreate.telegram_id.text = widget.user!.telegram_id == null
          ? " "
          : widget.user!.telegram_id.toString();
      _selectedOrg = OrganizationShort(
          id: widget.user!.organization.id,
          name: widget.user!.organization.name);
      _selectedDept = DepartmentShort(
          id: widget.user!.department.id, name: widget.user!.department.name);
      _selectedGroups = widget.user!.groups;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final dropDownTheme = Theme.of(context).extension<DropDownTextTheme>();

    List<Group> groupList = widget.bloc.state.groupList ?? [];
    List<OrganizationShort> orgList = widget.bloc.state.orgList ?? [];
    List<DepartmentShort> deptList = widget.bloc.state.deptList ?? [];

    return AlertDialog(
      scrollable: true,
      title: SizedBox(
        width: 600,
        child: Text(
            widget.user == null
                ? 'Создание пользователя'
                : 'Редактирование пользователя #${widget.user!.id}',
            style: theme.textTheme.headlineSmall),
      ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Имя'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _userCreate.first_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите Имя';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Фамилия'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _userCreate.last_name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите фамилию';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Отчество'),
                keyboardType: TextInputType.multiline,
                autofocus: true,
                controller: _userCreate.surname,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'введите отчество';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                controller: _userCreate.email,
                autofocus: true,
                validator: (value) {
                  if (value != null &&
                      value.isNotEmpty &&
                      !value.contains('@')) {
                    return 'введите Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Имя пользователя'),
                controller: _userCreate.username,
                autofocus: true,
                validator: (value) {
                  if (value == null) {
                    return 'введите мя пользователя';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.user == null)
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value!.length <= 8) {
                                return 'пароль должен быть менее 8 символов';
                              }
                              if (value.isEmpty) {
                                return 'Введите пароль';
                              }
                              if (value != _userCreate.passwordConfirm.text) {
                                return 'Пароли не совпадают';
                              }
                              return null;
                            },
                            controller: _userCreate.password,
                            obscureText:
                                _isShowPasswordInputText ? false : true,
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              labelText: 'Пароль',
                            ),
                          ),
                        ),
                        IconButton(
                            style: buttonsTheme.iconButtonClear,
                            onPressed: () {
                              setState(() {
                                _isShowPasswordInputText =
                                    !_isShowPasswordInputText;
                              });
                            },
                            icon: const Icon(
                              Symbols.visibility,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              if (widget.user == null)
                Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите пароль';
                              }
                              if (value != _userCreate.password.text) {
                                return 'Пароли не совпадают';
                              }
                              return null;
                            },
                            controller: _userCreate.passwordConfirm,
                            obscureText:
                                _isShowPasswordInputText ? false : true,
                            autofocus: true,
                            keyboardType: TextInputType.multiline,
                            decoration: const InputDecoration(
                              // contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                              labelText: 'Подтверждение пароля',
                            ),
                          ),
                        ),
                        IconButton(
                            style: buttonsTheme.iconButtonClear,
                            onPressed: () {
                              setState(() {
                                _isShowPasswordInputText =
                                    !_isShowPasswordInputText;
                              });
                            },
                            icon: const Icon(
                              Symbols.visibility,
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Telegram ID'),
                keyboardType:
                    TextInputType.number, // Изменил на number для ввода чисел
                autofocus: true,
                controller: _userCreate.telegram_id,
                validator: (value) {
                  // Проверка на пустое значение — это допустимо
                  if (value == null || value.isEmpty) {
                    return null;
                  }

                  // Если значение не пустое, проверяем, что оно числовое
                  final isNumeric = int.tryParse(value);
                  if (isNumeric == null) {
                    return 'Пожалуйста, введите числовое значение';
                  }

                  return null; // Нет ошибок
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: _userCreate.is_staff,
                      onChanged: (bool? value) {
                        setState(() {
                          _userCreate.is_staff = value!;
                        });
                      },
                    ),
                    Text(
                      'Администратор',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: _userCreate.is_superuser,
                      onChanged: (bool? value) {
                        setState(() {
                          _userCreate.is_superuser = value!;
                        });
                      },
                    ),
                    Text(
                      'Суперпользователь',
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<Group>.multiSelection(
                  compareFn: (i, s) => i.id == s.id,
                  popupProps: const PopupPropsMultiSelection.menu(
                    isFilterOnline: true,
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                    ),
                  ),
                  asyncItems: (String filter) async {
                    return groupList
                        .where((element) => element.name
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (Group data) {
                    return data.name;
                  },
                  selectedItems: _selectedGroups,
                  onChanged: (List<Group>? data) {
                    _selectedGroups = data ?? [];
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration: const InputDecoration(
                      labelText: "Группы",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<OrganizationShort>(
                  compareFn: (i, s) => i.id == s.id,
                  popupProps: const PopupPropsMultiSelection.menu(
                    isFilterOnline: true,
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                    ),
                  ),
                  asyncItems: (String filter) async {
                    return orgList
                        .where((element) => element
                            .getOrganizationsName()
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (OrganizationShort u) {
                    return u.getOrganizationsName();
                  },
                  selectedItem: _selectedOrg,
                  onChanged: (OrganizationShort? data) {
                    setState(() {
                      _selectedOrg = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration:
                        const InputDecoration(labelText: "Организации"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownSearch<DepartmentShort>(
                  compareFn: (i, s) => i.id == s.id,
                  popupProps: const PopupPropsMultiSelection.menu(
                    isFilterOnline: true,
                    showSelectedItems: true,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autofocus: true,
                    ),
                  ),
                  asyncItems: (String filter) async {
                    return deptList
                        .where((element) => element
                            .getDepartmentName()
                            .toLowerCase()
                            .contains(filter.toLowerCase()))
                        .toList();
                  },
                  itemAsString: (DepartmentShort u) {
                    return u.getDepartmentName();
                  },
                  selectedItem: _selectedDept,
                  onChanged: (DepartmentShort? data) {
                    setState(() {
                      _selectedDept = data;
                    });
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    baseStyle: dropDownTheme?.dropDownText,
                    dropdownSearchDecoration:
                        const InputDecoration(labelText: "Отдел"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            int.tryParse(_userCreate.telegram_id.text);
            if (_formKey.currentState!.validate()) {
              User? user = widget.user;
              // int? telegramId = int.tryParse(_userCreate.telegram_id.text);

              if (user != null) {
                widget.bloc.add(EditUserEvent(
                  id: user.id,
                  last_name: _userCreate.last_name.text,
                  first_name: _userCreate.first_name.text,
                  email: _userCreate.email.text,
                  is_staff: _userCreate.is_staff,
                  // is_active: _userCreate.is_active,
                  is_superuser: _userCreate.is_superuser,
                  organization: _selectedOrg != null
                      ? _selectedOrg!.name
                      : widget.user!.organization.name,
                  department: _selectedDept != null
                      ? _selectedDept!.name
                      : widget.user!.department.name,
                  groups: _selectedGroups,
                  username: user.username,
                  surname: _userCreate.surname.text,
                  telegram_id: _userCreate.telegram_id.text == ''
                      ? null
                      : _userCreate.telegram_id.text,
                ));
              } else {
                widget.bloc.add(CreateNewUserEvent(
                  last_name: _userCreate.last_name.text,
                  first_name: _userCreate.first_name.text,
                  is_staff: _userCreate.is_staff,
                  // is_active: _userCreate.is_active,
                  is_superuser: _userCreate.is_superuser,
                  organization: _selectedOrg != null ? _selectedOrg!.name : '',
                  department: _selectedDept != null ? _selectedDept!.name : '',
                  surname: _userCreate.surname.text,
                  groups: _selectedGroups,
                  username: _userCreate.username.text,
                  email: _userCreate.email.text,
                  password: _userCreate.password.text,

                  telegram_id: _userCreate.telegram_id.text.isEmpty
                      ? null
                      : _userCreate.telegram_id.text,

                  // telegram_id: _userCreate.telegram_id.text == ''
                  //     ? null
                  //     : _userCreate.telegram_id.text,
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
