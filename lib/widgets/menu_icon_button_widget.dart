// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class MenuIconButtonWidget extends StatelessWidget {
  final String name;
  final String path;
  final String parent;
  final IconData icon;

  const MenuIconButtonWidget(
      {super.key,
      required this.name,
      required this.path,
      required this.parent,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final bool isActive = currentRoute.endsWith(path);

    return TextButton(
      onPressed: () => context.go(parent + path),
      style: buttonsTheme.menuButton,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(name),
          ],
        ),
      ),
    );
  }
}
