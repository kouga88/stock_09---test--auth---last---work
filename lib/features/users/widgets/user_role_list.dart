import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';

class UserRoleListWidget extends StatelessWidget {
  const UserRoleListWidget({
    super.key,
    required this.theme,
    required this.user,
  });

  final ThemeData theme;
  final User user;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      shape: theme.expansionTileTheme.shape,
      title: Column(
        children: [
          Row(
            children: [
              Text('Роли',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w700)),
            ],
          ),
          const Divider(height: 7, color: Color.fromARGB(255, 109, 109, 109)),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (user.is_staff) const Text(' - Администратор'),
                    if (user.is_superuser) const Text(' - Суперпользователь'),
                    if (user.is_active) const Text(' - Активный'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
