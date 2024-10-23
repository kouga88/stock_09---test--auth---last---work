import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/users/bloc/user_bloc.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';
import 'package:pronet_storeroom_v_01/features/users/widgets/User_create_form.dart';

class UserListTable700Widget extends StatelessWidget {
  const UserListTable700Widget({
    super.key,
    required this.userList,
    required UserBloc userBloc,
  }) : _userBloc = userBloc;

  final List<User> userList;
  final UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        for (int i = 0; i < userList.length; i++)
          InkWell(
            onDoubleTap: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => UserCreateFromWidget(
                  user: userList[i],
                  bloc: _userBloc,
                ),
              );
            },
            child: ListTile(
              leading: Text(userList[i].id.toString()),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userList[i].getFullName(),
                    style: theme.textTheme.bodyLarge,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        'Админ: ${userList[i].is_staff ? 'Да' : 'Нет'} | Активен: ${userList[i].is_active ? 'Да' : 'Нет'} | Суперпользователь: ${userList[i].is_superuser ? 'Да' : 'Нет'}',
                        style: theme.textTheme.bodySmall,
                      )),
                  Text(
                    'Организация: ${userList[i].organization}',
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
                          'Вы уверены что хотите удалить пользователя #${userList[i].id}?'),
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
                  _userBloc.add(DeleteUserEvent(id: userList[i].id));
                },
              ),
            ),
          ),
      ],
    );
  }
}
