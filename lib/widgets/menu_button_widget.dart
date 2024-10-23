import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class MenuButtonWidget extends StatelessWidget {
  final String name;
  final String path;
  final String parent;

  const MenuButtonWidget(
      {super.key,
      required this.name,
      required this.path,
      required this.parent});

  @override
  Widget build(BuildContext context) {
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final bool isActive = currentRoute.endsWith(path);

    return TextButton(
      onPressed: () => context.go(parent + path),
      style: buttonsTheme.menuButton?.copyWith(
        backgroundColor: MaterialStateProperty.all(
          isActive ? hoverColors2 : transparent,
        ),
        foregroundColor: MaterialStateProperty.all(
          greyBlue45Color,
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(name),
      ),
    );
  }
}
