import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/users/repo/models/user.dart';

class UserProjectListWidget extends StatelessWidget {
  const UserProjectListWidget({
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
              Text('Склад',
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
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for (ProjectShort project in user.projects ?? [])
                    //   Text(' - ${project.name}'),
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
