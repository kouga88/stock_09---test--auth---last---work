import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/auth/bloc/auth_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/bloc/organization_bloc.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/repo/models/organization.dart';
import 'package:pronet_storeroom_v_01/features/organizaton/widgets/organization_create_form.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

// class OrganizationListTableWidget extends StatelessWidget {
//   const OrganizationListTableWidget({
//     super.key,
//     required this.organizationList,
//     required OrganizationBloc organizationBloc,
//   }) : _organizationBloc = organizationBloc;

//   final List<Organization> organizationList;
//   final OrganizationBloc _organizationBloc;

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final width = MediaQuery.of(context).size.width;
//     final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

//     final ValueNotifier<List<Organization>> sortedOrganizationList =
//         ValueNotifier(organizationList);
//     final ValueNotifier<bool> sortAscending = ValueNotifier(true);

//     final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

//     void sort<T>(Comparable<T> Function(Organization organization) getField,
//         int columnIndex) {
//       if (sortedColumnIndex.value == columnIndex) {
//         sortAscending.value = !sortAscending.value;
//       } else {
//         sortAscending.value = true;
//         sortedColumnIndex.value = columnIndex;
//       }

//       sortedOrganizationList.value = List.from(organizationList)
//         ..sort((a, b) {
//           final aValue = getField(a);
//           final bValue = getField(b);
//           return sortAscending.value
//               ? Comparable.compare(aValue, bValue)
//               : Comparable.compare(bValue, aValue);
//         });
//     }

//     return SingleChildScrollView(
//       child: ValueListenableBuilder<List<Organization>>(
//         valueListenable: sortedOrganizationList,
//         builder: (context, sortedList, child) {
//           return Theme(
//             data: Theme.of(context).copyWith(
//               dividerColor: Colors.transparent,
//               dividerTheme: const DividerThemeData(
//                 color: Colors.transparent,
//                 space: 0,
//                 thickness: 0,
//                 indent: 0,
//                 endIndent: 0,
//               ),
//             ),
//             child: DataTable(
//               dividerThickness: 1.0,
//               showCheckboxColumn: false,
//               sortAscending: sortAscending.value,
//               columns: <DataColumn>[
//                 DataColumn(
//                   label: Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text(
//                           'ID',
//                           style: theme.textTheme.headlineMedium,
//                         ),
//                         const SizedBox(width: 10),
//                         const Icon(Icons.sort, color: greyBlueColor75),
//                       ],
//                     ),
//                   ),
//                   onSort: (columnIndex, _) {
//                     sort<num>((organization) => organization.id, columnIndex);
//                   },
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Row(
//                       children: [
//                         Text(
//                           'Название',
//                           style: theme.textTheme.headlineMedium,
//                         ),
//                         const SizedBox(width: 10),
//                         const Icon(Icons.sort, color: greyBlueColor75),
//                       ],
//                     ),
//                   ),
//                   onSort: (columnIndex, _) {
//                     sort<String>(
//                         (organization) => organization.getOrganizationsName(),
//                         columnIndex);
//                   },
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Row(
//                       children: [
//                         Text(
//                           'Описание',
//                           style: theme.textTheme.headlineMedium,
//                         ),
//                         const SizedBox(width: 10),
//                         const Icon(Icons.sort, color: greyBlueColor75),
//                       ],
//                     ),
//                   ),
//                   onSort: (columnIndex, _) {
//                     sort<String>(
//                         (organization) => organization.description.toString(),
//                         columnIndex);
//                   },
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           'Действия',
//                           style: theme.textTheme.headlineMedium,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//               rows: <DataRow>[
//                 for (int i = 0; i < sortedList.length; i++)
//                   DataRow(
//                     onSelectChanged: (value) {
//                       final organizationeId = sortedList[i].id;
//                       context.go('/handbook/organizations/$organizationeId');
//                     },
//                     color: MaterialStateProperty.resolveWith<Color?>(
//                         (Set<MaterialState> states) {
//                       if (i % 2 == 0) {
//                         return theme.colorScheme.primary.withOpacity(0.1);
//                       }
//                       return null;
//                     }),
//                     cells: <DataCell>[
//                       DataCell(
//                           Text(sortedList[i].id.toString())), // Первая колонка
//                       DataCell(Text(sortedList[i].getOrganizationsName())),
//                       DataCell(
//                         Text(
//                           sortedList[i].description == null
//                               ? ''
//                               : sortedList[i].description.toString(),
//                         ),
//                       ),
//                       // if (width > 700)
//                       DataCell(
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
//                                       OrganizationCreateFromWidget(
//                                     organization: sortedList[i],
//                                     bloc: _organizationBloc,
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
//                                         'Вы уверены что хотите удалить организацию #${sortedList[i].id}?'),
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

//                                 _organizationBloc.add(DeleteOrganizationEvent(
//                                     id: sortedList[i].id));
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class OrganizationListTableWidget extends StatelessWidget {
  const OrganizationListTableWidget({
    super.key,
    required this.authState,
    required this.organizationList,
    required OrganizationBloc organizationBloc,
  }) : _organizationBloc = organizationBloc;

  final AuthSuccessedState authState;
  final List<Organization> organizationList;
  final OrganizationBloc _organizationBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final width = MediaQuery.of(context).size.width;
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

    final ValueNotifier<List<Organization>> sortedOrganizationList =
        ValueNotifier(organizationList);
    final ValueNotifier<bool> sortAscending = ValueNotifier(true);

    final ValueNotifier<int?> sortedColumnIndex = ValueNotifier(null);

    void sort<T>(Comparable<T> Function(Organization organization) getField,
        int columnIndex) {
      if (sortedColumnIndex.value == columnIndex) {
        sortAscending.value = !sortAscending.value;
      } else {
        sortAscending.value = true;
        sortedColumnIndex.value = columnIndex;
      }

      sortedOrganizationList.value = List.from(organizationList)
        ..sort((a, b) {
          final aValue = getField(a);
          final bValue = getField(b);
          return sortAscending.value
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        });
    }

    return SingleChildScrollView(
      child: ValueListenableBuilder<List<Organization>>(
        valueListenable: sortedOrganizationList,
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
                    sort<num>((organization) => organization.id, columnIndex);
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
                        (organization) => organization.getOrganizationsName(),
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
                        (organization) => organization.description.toString(),
                        columnIndex);
                  },
                ),
                if (authState.user.is_staff) // если администратор показываем
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
                    onSelectChanged: (value) {
                      final organizationeId = sortedList[i].id;
                      context.go('/handbook/organizations/$organizationeId');
                    },
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
                      DataCell(Text(sortedList[i].getOrganizationsName())),
                      DataCell(
                        Text(
                          sortedList[i].description == null
                              ? ''
                              : sortedList[i].description.toString(),
                        ),
                      ),
                      // if (width > 700)
                      if (authState.user.is_staff)
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
                                        OrganizationCreateFromWidget(
                                      organization: sortedList[i],
                                      bloc: _organizationBloc,
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
                                          'Вы уверены что хотите удалить организацию #${sortedList[i].id}?'),
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

                                  _organizationBloc.add(DeleteOrganizationEvent(
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
