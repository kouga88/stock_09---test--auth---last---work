import 'package:flutter/material.dart';

import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/bloc/suppliers_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/repo/models/suppliers.dart';
import 'package:pronet_storeroom_v_01/features/settings/suppliers/widgets/suppliers_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class SuppliersListTableWidget extends StatelessWidget {
  const SuppliersListTableWidget({
    super.key,
    required this.suppliersList,
    required SuppliersBloc suppliersBloc,
  }) : _suppliersBloc = suppliersBloc;

  final List<Suppliers> suppliersList;
  final SuppliersBloc _suppliersBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<Suppliers>> sortedSuppliersList =
        ValueNotifier(suppliersList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(
        Comparable<T> Function(Suppliers suppliers) getField, int columnIndex) {
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      sortedSuppliersList.value = List.from(suppliersList)
        ..sort((a, b) {
          final aValue = getField(a);
          final bValue = getField(b);
          return sortAscending.value
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
    }

    return SingleChildScrollView(
      child: ValueListenableBuilder<List<Suppliers>>(
        valueListenable: sortedSuppliersList,
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<num>((suppliers) => suppliers.id, columnIndex);
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (suppliers) => suppliers.name.toString(), columnIndex);
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (suppliers) => suppliers.description.toString(),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Действия',
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
                      DataCell(
                          Text(sortedList[i].id.toString())), // Первая колонка
                      DataCell(Text(sortedList[i].name.toString())),
                      DataCell(
                        Text(
                          sortedList[i].description == null
                              ? ''
                              : sortedList[i].description.toString(),
                        ),
                      ),
                      if (width > 700)
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
                                        SuppliersCreateFormWidget(
                                      suppliers: sortedList[i],
                                      bloc: _suppliersBloc,
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
                                          'Вы уверены что хотите удалить поставщика  ${sortedList[i].name}?'),
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

                                  _suppliersBloc.add(DeleteSuppliersEvent(
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
