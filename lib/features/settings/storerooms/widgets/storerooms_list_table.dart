import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/bloc/storerooms_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';

import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class StoreroomListTableWidget extends StatelessWidget {
  const StoreroomListTableWidget({
    super.key,
    required this.storeroomList,
    required StoreroomBloc storeroomBloc,
  }) : _storeroomBloc = storeroomBloc;

  final List<Storeroom> storeroomList;
  final StoreroomBloc _storeroomBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<Storeroom>> sortedStoreroomList =
        ValueNotifier(storeroomList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(
        Comparable<T> Function(Storeroom storeroom) getField, int columnIndex) {
      // Проверка, если уже сортируется по этой колонке, переключаем направление сортировки
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        // Если выбрана новая колонка для сортировки, сбрасываем на восходящую сортировку
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      // Сортируем список пользователей
      sortedStoreroomList.value = List.from(storeroomList)
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
      child: ValueListenableBuilder<List<Storeroom>>(
        valueListenable: sortedStoreroomList,
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
              dividerThickness: 1.0,
              showCheckboxColumn: false,
              sortAscending: sortAscending.value,
              columns: <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    sort<num>((storeroom) => storeroom.id, columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Название',
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
                        (storeroom) => storeroom.getName(), columnIndex);
                  },
                ),
                if (width > 700)
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
                          (storeroom) => storeroom.organization.toString(),
                          columnIndex);
                    },
                  ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Описание',
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
                        (storeroom) => storeroom.description.toString(),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                      final storeroomId = sortedList[i].id;
                      context.go(
                          '/storehouse/settings/storerooms/storeroom/$storeroomId');
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
                      DataCell(Text(sortedList[i].getName())),
                      if (width > 700)
                        DataCell(Text(sortedList[i].organization.name ?? '')),
                      DataCell(Text(sortedList[i].description.toString())),
                      DataCell(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                                      StoreroomCreateFromWidget(
                                    storeroom: sortedList[i],
                                    bloc: _storeroomBloc,
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
                                        'Вы уверены что хотите удалить склад #${sortedList[i].id}?'),
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

                                _storeroomBloc.add(
                                    DeleteStoreroomEvent(id: sortedList[i].id));
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
