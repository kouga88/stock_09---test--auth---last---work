import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/bloc/nomenclatures_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/repo/models/nomenclatures.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures/widgets/nomenclatures_create_form.dart';
import 'package:pronet_storeroom_v_01/features/settings/units/repo/models/units_short.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class NomenclaturesListWidget extends StatelessWidget {
  const NomenclaturesListWidget({
    super.key,
    required this.nomenclaturesList,
    required NomenclaturesBloc nomenclaturesBloc,
  }) : _nomenclaturesBloc = nomenclaturesBloc;

  final List<Nomenclatures> nomenclaturesList;
  final NomenclaturesBloc _nomenclaturesBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: nomenclaturesList.length,
          shrinkWrap: true,
          physics:
              const NeverScrollableScrollPhysics(), // Позволяет прокручивать весь экран
          itemBuilder: (context, index) {
            final nomenclature = nomenclaturesList[index];

            return Card(
              surfaceTintColor: const Color.fromARGB(255, 196, 196, 196),
              // color: Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Отображение ID

                            // Отображение Наименования
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // color: Colors.blue,
                                  padding: EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'ID:',
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Text(
                                        '${nomenclature.id}',
                                        style: theme.textTheme.bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Text('Наименование: ',
                                        style: theme.textTheme.labelMedium!),
                                    Text('${nomenclature.name}',
                                        style: theme.textTheme.bodyMedium),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Склад: ',
                                      style: theme.textTheme.labelMedium,
                                    ),
                                    Text(
                                      nomenclature.storeroom?.name ??
                                          'Не указано',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Text(
                                      'Ед. измерения: ',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    Text(
                                      nomenclature.unit?.short_name ??
                                          'Не указано',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                Row(
                                  children: [
                                    Text('Параметры: ',
                                        style: theme.textTheme.labelMedium),
                                    Text(
                                      nomenclature.parameters?.map((params) {
                                            var unitShortName = UnitShort(
                                              id: params.unit?.id,
                                              short_name:
                                                  params.unit?.short_name ?? '',
                                              name: params.unit?.name ?? '',
                                            );
                                            return '${params.name}: ${params.value ?? ''} ${unitShortName.name}';
                                          }).join('; ') ??
                                          'Нет параметров',
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                //
                                Row(
                                  children: [
                                    Text(
                                      'Группы: ',
                                      style: theme.textTheme.labelMedium,
                                    ),
                                    Text(
                                      nomenclature.groups
                                              ?.map(
                                                  (group) => '${group.name} /')
                                              .join(', ') ??
                                          'Нет групп',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20),
                                if (nomenclature.description != null)
                                  Row(
                                    children: [
                                      Text(
                                        'Описание:',
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      Text(
                                        nomenclature.description ??
                                            'Нет описания',
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: 16),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // Отображение Описания

                            // Действия
                          ],
                        ),
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
                                    nomenclatures: nomenclature,
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
                                        'Вы уверены, что хотите удалить группу #${nomenclature.id}?'),
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

                                _nomenclaturesBloc.add(DeleteNomenclaturesEvent(
                                    id: nomenclature.id));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
