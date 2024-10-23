import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/bloc/user_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/User_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class UserListTableWidget extends StatelessWidget {
  const UserListTableWidget({
    super.key,
    required this.authState,
    required this.userList,
    required UserBloc userBloc,
  }) : _userBloc = userBloc;

  final List<User> userList;
  final UserBloc _userBloc;
  final AuthSuccessedState authState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<User>> sortedUserList = ValueNotifier(userList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(Comparable<T> Function(User user) getField, int columnIndex) {
      // Проверка, если уже сортируется по этой колонке, переключаем направление сортировки
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        // Если выбрана новая колонка для сортировки, сбрасываем на восходящую сортировку
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      // Сортируем список пользователей
      sortedUserList.value = List.from(userList)
        ..sort((a, b) {
          final aValue = getField(a);
          final bValue = getField(b);

          // Сортировка в зависимости от направления
          return sortAscending.value
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
    }

    return SingleChildScrollView(
      child: ValueListenableBuilder<List<User>>(
        valueListenable: sortedUserList,
        builder: (context, sortedList, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              dividerTheme: const DividerThemeData(
                color: Colors.transparent,
                space: 0,
                thickness: 0,
                indent: 0,
                endIndent: 0,
              ),
            ),
            child: DataTable(
              dataTextStyle: theme.textTheme.bodySmall,
              dataRowMinHeight: 40, // высота строки
              dataRowMaxHeight: 60, // высота строки
              dividerThickness: 10.0,
              showCheckboxColumn: false,
              sortAscending: sortAscending.value,
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'ID',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<num>((user) => user.id, columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'ФИО',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>((user) => user.getFullName(), columnIndex);
                  },
                ),
                if (width > 700)
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Логин',
                            style: theme.textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.sort,
                            color: greyBlueColor75,
                          )
                        ],
                      ),
                    ),
                    onSort: (columnIndex, _) {
                      sort<String>((user) => user.username, columnIndex);
                    },
                  ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Организация',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (user) => user.organization.toString(), columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Отдел',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (user) => user.department.name ?? '', columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Группы',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (user) => user.groups
                            .map((group) => group.name.toString())
                            .join(', '),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Роли',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.sort,
                          color: greyBlueColor75,
                        )
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<num>((user) => user.is_superuser ? 1 : 0, columnIndex);
                  },
                ),
                if (authState.user.is_staff)
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Действие',
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
              rows: <DataRow>[
                for (int i = 0; i < sortedList.length; i++)
                  DataRow(
                    onSelectChanged: (value) {
                      final usereId = sortedList[i].id;
                      context.go('/handbook/users/$usereId');
                    },
                    color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      if (i % 2 == 0) {
                        return theme.colorScheme.primary.withOpacity(0.1);
                      }
                      return null;
                    }),
                    cells: <DataCell>[
                      DataCell(Text(sortedList[i].id.toString())),
                      DataCell(Text(sortedList[i].getFullName())),
                      if (width > 700) DataCell(Text(sortedList[i].username)),
                      DataCell(Text(sortedList[i].organization.name ?? '')),
                      DataCell(Text(sortedList[i].department.name ?? '')),
                      DataCell(
                        Text(sortedList[i]
                            .groups
                            .map((group) => group.name.toString())
                            .join(', ')),
                      ),
                      DataCell(SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(sortedList[i].is_active == true
                                ? 'Активный,'
                                : ''),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(sortedList[i].is_superuser == true
                                ? 'Super user,'
                                : ''),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(sortedList[i].is_staff == true
                                ? 'Администратор'
                                : '')
                          ],
                        ),
                      )),
                      if (authState.user.is_staff)
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Symbols.edit,
                                  color: greyBlue45Color,
                                  size: 16,
                                ),
                                onPressed: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        UserCreateFromWidget(
                                      user: sortedList[i],
                                      bloc: _userBloc,
                                    ),
                                  );
                                },
                                style: buttonsTheme.iconButtonEdit,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Symbols.delete,
                                  color: dangerColor,
                                  size: 17,
                                ),
                                style: buttonsTheme.iconButtonEdit,
                                onPressed: () async {
                                  final result = await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Вы уверены?'),
                                      content: Text(
                                          'Вы уверены что хотите удалить пользователя #${sortedList[i].id}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text('Отмена'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text('Удалить'),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (result == null || !result) {
                                    return;
                                  }

                                  _userBloc.add(
                                      DeleteUserEvent(id: sortedList[i].id));
                                },
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
