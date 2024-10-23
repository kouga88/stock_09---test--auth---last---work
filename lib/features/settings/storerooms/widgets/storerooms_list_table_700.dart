import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/bloc/storerooms_bloc.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/repo/models/storerooms.dart';
import 'package:pronet_storeroom_v_01/features/settings/storerooms/widgets/storerooms_create_form.dart';

class StoreroomListTable700Widget extends StatelessWidget {
  const StoreroomListTable700Widget({
    super.key,
    required this.storeroomList,
    required StoreroomBloc storeroomBloc,
  }) : _storeroomBloc = storeroomBloc;

  final List<Storeroom> storeroomList;
  final StoreroomBloc _storeroomBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        for (int i = 0; i < storeroomList.length; i++)
          InkWell(
            onDoubleTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => StoreroomCreateFromWidget(
                  storeroom: storeroomList[i],
                  bloc: _storeroomBloc,
                ),
              );
            },
            child: ListTile(
              leading: Text(storeroomList[i].id.toString()),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeroomList[i].getName(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text(
                    'Организация: ${storeroomList[i].organization}',
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
                          'Вы уверены что хотите удалить резерв #${storeroomList[i].id}?'),
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
                      .add(DeleteStoreroomEvent(id: storeroomList[i].id));
                },
              ),
            ),
          ),
      ],
    );
  }
}
