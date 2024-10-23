// Виджет кнопки
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/common/buttons/fullButton/full_button_model.dart';
import 'package:pronet_storeroom_v_01/themes/buttons_theme.dart';

class FullButtonWidget extends StatelessWidget {
  final FullButtonModel button;

  const FullButtonWidget({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    final buttonsTheme = Theme.of(context).extension<ButtonsTheme>()!;
    return TextButton(
      style: buttonsTheme.menuButton,
      onPressed: () => context.go(button.path),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(button.name),
      ),
    );
  }
}
