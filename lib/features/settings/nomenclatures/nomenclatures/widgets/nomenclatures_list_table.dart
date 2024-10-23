import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/bloc/nomenclatures_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/widgets/nomenclatures_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesListTableWidget extends StatelessWidget {
  const NomenclaturesListTableWidget({
    super.key,
    required this.nomenclaturesList,
    required NomenclaturesBloc nomenclaturesBloc,
  }) : _nomenclaturesBloc = nomenclaturesBloc;

  final List<Nomenclatures> nomenclaturesList;
  final NomenclaturesBloc _nomenclaturesBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final ValueNotifier<List<Nomenclatures>> sortedNomenclaturesList =
        ValueNotifier(nomenclaturesList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(Comparable<T> Function(Nomenclatures nomenclatures) getField,
        int columnIndex) {
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      sortedNomenclaturesList.value = List.from(nomenclaturesList)
        ..sort((a, b) {
          final aValue = getField(a);
          final bValue = getField(b);
          return sortAscending.value
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
    }

    return SingleChildScrollView(
      child: ValueListenableBuilder<List<Nomenclatures>>(
        valueListenable: sortedNomenclaturesList,
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
                    sort<num>((nomenclatures) => nomenclatures.id, columnIndex);
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.name.toString(),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Cклад',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.name.toString(),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Ед.измерения',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.description.toString(),
                        columnIndex);
                  },
                ),
                DataColumn(
                  label: Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Параметры',
                          style: theme.textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.description.toString(),
                        columnIndex);
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.description.toString(),
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
                        const SizedBox(width: 10),
                        const Icon(Icons.sort, color: greyBlueColor75),
                      ],
                    ),
                  ),
                  onSort: (columnIndex, _) {
                    sort<String>(
                        (nomenclatures) => nomenclatures.description.toString(),
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
                      DataCell(Text(sortedList[i].storeroom!.name.toString())),
                      DataCell(Text(sortedList[i].unit!.short_name.toString())),
                      DataCell(
                        Text(
                          sortedList[i].parameters!.map((params) {
                            // Проверка, что params.unit не является null и значение short_name не null
                            var unitShortName = UnitShort(
                              id: params.unit?.id,
                              short_name: params.unit?.short_name ??
                                  '', // Использование '' если short_name null
                              name: params.unit?.name ??
                                  '', // Использование '' если name null
                            );

                            // Формирование строки с учетом наличия значения и единицы измерения
                            return '${params.name}: ${params.value ?? ''} ${unitShortName.name}';
                          }).join(';'
                              '\n'), // Использование \n для вывода в столбик
                          textAlign:
                              TextAlign.left, // Выравнивание текста в ячейке
                        ),
                      ),

                      DataCell(
                        Text(sortedList[i]
                            .groups!
                            .map((group) => group.name.toString())
                            .join(', ')),
                      ),

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
                                        NomenclaturesCreateFormWidget(
                                      nomenclatures: sortedList[i],
                                      bloc: _nomenclaturesBloc,
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
                                          'Вы уверены что хотите удалить группу  #${sortedList[i].id}?'),
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

                                  _nomenclaturesBloc.add(
                                      DeleteNomenclaturesEvent(
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

//вид в виде таблиц

// import 'package:flutter/material.dart';
// import 'package:material_symbols_icons/symbols.dart';
// import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/bloc/nomenclatures_bloc.dart';
// import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
// import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/widgets/nomenclatures_create_form.dart';
// import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
// import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
// import 'package:pronet_storeroom_v_01/themes/theme.dart';

// class NomenclaturesListWidget extends StatelessWidget {
//   const NomenclaturesListWidget({
//     super.key,
//     required this.nomenclaturesList,
//     required NomenclaturesBloc nomenclaturesBloc,
//   }) : _nomenclaturesBloc = nomenclaturesBloc;

//   final List<Nomenclatures> nomenclaturesList;
//   final NomenclaturesBloc _nomenclaturesBloc;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

//     return Padding(
//       padding: const EdgeInsets.only(top: 8.0),
//       child: SingleChildScrollView(
//         child: ListView.builder(
//           itemCount: nomenclaturesList.length,
//           shrinkWrap: true,
//           physics:
//               const NeverScrollableScrollPhysics(), // Позволяет прокручивать весь экран
//           itemBuilder: (context, index) {
//             final nomenclature = nomenclaturesList[index];

//             return Card(
//               surfaceTintColor: Colors.transparent,
//               color: Color.fromARGB(255, 255, 255, 255),
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Отображение ID

//                             // Отображение Наименования
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   color: Colors.red,
//                                   child: Row(
//                                     children: [
//                                       Text(
//                                         'ID:',
//                                         style: theme.textTheme.labelMedium,
//                                       ),
//                                       Text(
//                                         '${nomenclature.id}',
//                                         style: theme.textTheme.bodyMedium,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Row(
//                                   children: [
//                                     Text('Наименование: ',
//                                         style: theme.textTheme.labelMedium!),
//                                     Text('${nomenclature.name}',
//                                         style: theme.textTheme.bodyMedium),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Склад: ',
//                                       style: theme.textTheme.labelMedium,
//                                     ),
//                                     Text(
//                                       nomenclature.storeroom?.name ??
//                                           'Не указано',
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Ед. измерения: ',
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                     Text(
//                                       nomenclature.unit?.short_name ??
//                                           'Не указано',
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 20),
//                                 Row(
//                                   children: [
//                                     Text('Параметры: ',
//                                         style: theme.textTheme.labelMedium),
//                                     Text(
//                                       nomenclature.parameters?.map((params) {
//                                             var unitShortName = UnitShort(
//                                               id: params.unit?.id,
//                                               short_name:
//                                                   params.unit?.short_name ?? '',
//                                               name: params.unit?.name ?? '',
//                                             );
//                                             return '${params.name}: ${params.value ?? ''} ${unitShortName.name}';
//                                           }).join('; ') ??
//                                           'Нет параметров',
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 20),
//                                 //
//                                 Row(
//                                   children: [
//                                     Text(
//                                       'Группы: ',
//                                       style: theme.textTheme.labelMedium,
//                                     ),
//                                     Text(
//                                       nomenclature.groups
//                                               ?.map(
//                                                   (group) => '${group.name} /')
//                                               .join(', ') ??
//                                           'Нет групп',
//                                       style: theme.textTheme.bodyMedium,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 20),
//                                 if (nomenclature.description != null)
//                                   Row(
//                                     children: [
//                                       Text(
//                                         'Описание:',
//                                         style: theme.textTheme.labelMedium,
//                                       ),
//                                       Text(
//                                         nomenclature.description ??
//                                             'Нет описания',
//                                         style: theme.textTheme.bodyMedium,
//                                       ),
//                                     ],
//                                   ),
//                                 const SizedBox(height: 16),
//                               ],
//                             ),
//                             const SizedBox(height: 8),

//                             // Отображение Описания

//                             // Действия
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             IconButton(
//                               icon: const Icon(
//                                 Symbols.edit,
//                                 color: greyBlue45Color,
//                                 size: 16,
//                               ),
//                               onPressed: () {
//                                 showDialog<String>(
//                                   context: context,
//                                   builder: (BuildContext context) =>
//                                       NomenclaturesCreateFormWidget(
//                                     nomenclatures: nomenclature,
//                                     bloc: _nomenclaturesBloc,
//                                   ),
//                                 );
//                               },
//                               style: buttonsTheme.iconButtonEdit,
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Symbols.delete,
//                                 color: dangerColor,
//                                 size: 17,
//                               ),
//                               style: buttonsTheme.iconButtonEdit,
//                               onPressed: () async {
//                                 final result = await showDialog<bool>(
//                                   context: context,
//                                   builder: (context) => AlertDialog(
//                                     title: const Text('Вы уверены?'),
//                                     content: Text(
//                                         'Вы уверены, что хотите удалить группу #${nomenclature.id}?'),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () =>
//                                             Navigator.pop(context, false),
//                                         child: const Text('Отмена'),
//                                       ),
//                                       TextButton(
//                                         onPressed: () =>
//                                             Navigator.pop(context, true),
//                                         child: const Text('Удалить'),
//                                       ),
//                                     ],
//                                   ),
//                                 );

//                                 if (result == null || !result) {
//                                   return;
//                                 }

//                                 _nomenclaturesBloc.add(DeleteNomenclaturesEvent(
//                                     id: nomenclature.id));
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
