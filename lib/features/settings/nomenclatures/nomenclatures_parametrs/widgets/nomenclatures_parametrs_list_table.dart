import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/bloc/nomenclatures_parametrs_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesParametrsListTableWidget extends StatelessWidget {
  const NomenclaturesParametrsListTableWidget({
    super.key,
    required this.paramNomList,
    required NomenclaturesParametrsBloc paramNomBlock,
  }) : _paramNomBlock = paramNomBlock;

  final List<NomenclaturesParametrs> paramNomList;
  final NomenclaturesParametrsBloc _paramNomBlock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<NomenclaturesParametrs>>
        sortedNomenclaturesParametrsList = ValueNotifier(paramNomList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(
        Comparable<T> Function(NomenclaturesParametrs reserves) getField,
        int columnIndex) {
      // Проверка, если уже сортируется по этой колонке, переключаем направление сортировки
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        // Если выбрана новая колонка для сортировки, сбрасываем на восходящую сортировку
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      // Сортируем список пользователей
      sortedNomenclaturesParametrsList.value = List.from(paramNomList)
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
      child: ValueListenableBuilder<List<NomenclaturesParametrs>>(
        valueListenable: sortedNomenclaturesParametrsList,
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
                            'Ед. измерения',
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
                        (reserves) => reserves.toString(), columnIndex);
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
                            Text(sortedList[i].unit!.short_name.toString())),
                      DataCell(Text(
                        sortedList[i].description == null
                            ? ''
                            : sortedList[i].description.toString(),
                      )),
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
                                      NomenclaturesParametrsCreateFromWidget(
                                    paramsNom: sortedList[i],
                                    bloc: _paramNomBlock,
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
                                        'Вы уверены что хотите удалить параметр номенклатуры #${sortedList[i].id}?'),
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

                                _paramNomBlock.add(
                                    DeleteNomenclaturesParametrsEvent(
                                        id: sortedList[i].id));
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
