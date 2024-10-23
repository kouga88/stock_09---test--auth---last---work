import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/bloc/reserves_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/widgets/reserves_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class ReservesListTableWidget extends StatelessWidget {
  const ReservesListTableWidget({
    super.key,
    required this.reservesList,
    required ReservesBloc storeroomBloc,
  }) : _storeroomBloc = storeroomBloc;

  final List<Reserves> reservesList;
  final ReservesBloc _storeroomBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<Reserves>> sortedReservesList =
        ValueNotifier(reservesList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(
        Comparable<T> Function(Reserves reserves) getField, int columnIndex) {
      // Проверка, если уже сортируется по этой колонке, переключаем направление сортировки
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        // Если выбрана новая колонка для сортировки, сбрасываем на восходящую сортировку
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      // Сортируем список пользователей
      sortedReservesList.value = List.from(reservesList)
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
      child: ValueListenableBuilder<List<Reserves>>(
        valueListenable: sortedReservesList,
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
                    sort<num>((reserves) => reserves.id, columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Наименование',
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
                    sort<String>((reserves) => reserves.getName(), columnIndex);
                  },
                ),
                if (width > 700)
                  DataColumn(
                    label: Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Склад',
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
                          (reserves) => reserves.description.toString(),
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
                        (reserves) => reserves.status.toString(), columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Статус',
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
                    sort<String>((reserves) => reserves.storeroom.toString(),
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
                      final reserveId = sortedList[i].id;
                      context.go('/storehouse/settings/reserve/$reserveId');
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
                        DataCell(
                            Text(sortedList[i].storeroom!.name.toString())),
                      DataCell(Text(
                        sortedList[i].description == null
                            ? ''
                            : sortedList[i].description.toString(),
                      )),
                      DataCell(Text(sortedList[i].status == false
                          ? ' Не активный'
                          : 'Активный')),
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
                                      ReservesCreateFromWidget(
                                    reserves: sortedList[i],
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
                                    DeleteReservesEvent(id: sortedList[i].id));
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
