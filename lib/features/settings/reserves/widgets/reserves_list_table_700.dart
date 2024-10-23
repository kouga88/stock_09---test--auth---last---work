import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/bloc/reserves_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/repo/models/reserves.dart';
import 'package:pronet_storeroom_v_01/features/settings/reserves/widgets/reserves_create_form.dart';

class ReservesListTable700Widget extends StatelessWidget {
  const ReservesListTable700Widget({
    super.key,
    required this.reservesList,
    required ReservesBloc storeroomBloc,
  }) : _storeroomBloc = storeroomBloc;

  final List<Reserves> reservesList;
  final ReservesBloc _storeroomBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        for (int i = 0; i < reservesList.length; i++)
          InkWell(
            onDoubleTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => ReservesCreateFromWidget(
                  reserves: reservesList[i],
                  bloc: _storeroomBloc,
                ),
              );
            },
            child: ListTile(
              leading: Text(reservesList[i].id.toString()),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reservesList[i].getName(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    'Организация: ${reservesList[i].storeroom}',
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
                          'Вы уверены что хотите удалить резерв #${reservesList[i].id}?'),
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
                  _storeroomBloc
                      .add(DeleteReservesEvent(id: reservesList[i].id));
                },
              ),
            ),
          ),
      ],
    );
  }
}
