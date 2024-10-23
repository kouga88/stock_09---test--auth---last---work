import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/bloc/nomenclatures_parametrs_bloc.dart';

import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/repo/models/nomenclatures_parametrs.dart';
import 'package:pronet_storeroom_v_01/features/settings/nomenclatures/nomenclatures_parametrs/widgets/nomenclatures_parametrs_create_form.dart';

class NomenclaturesParametrsListTable700Widget extends StatelessWidget {
  const NomenclaturesParametrsListTable700Widget({
    super.key,
    required this.nomenclaturesParametrsList,
    required NomenclaturesParametrsBloc paramNomBlock,
  }) : _paramNomBlock = paramNomBlock;

  final List<NomenclaturesParametrs> nomenclaturesParametrsList;
  final NomenclaturesParametrsBloc _paramNomBlock;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        for (int i = 0; i < nomenclaturesParametrsList.length; i++)
          InkWell(
            onDoubleTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    NomenclaturesParametrsCreateFromWidget(
                  paramsNom: nomenclaturesParametrsList[i],
                  bloc: _paramNomBlock,
                ),
              );
            },
            child: ListTile(
              leading: Text(nomenclaturesParametrsList[i].id.toString()),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomenclaturesParametrsList[i].getName(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    'Организация: ${nomenclaturesParametrsList[i].unit}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Color(0xffe62e2e),
                ),
                onPressed: () async {
                  final result = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Вы уверены?'),
                      content: Text(
                          'Вы уверены что хотите удалить резерв #${nomenclaturesParametrsList[i].id}?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Удалить'),
                        ),
                      ],
                    ),
                  );
                  if (result == null || !result) {
                    return;
                  }
                  _paramNomBlock.add(DeleteNomenclaturesParametrsEvent(
                      id: nomenclaturesParametrsList[i].id));
                },
              ),
            ),
          ),
      ],
    );
  }
}
