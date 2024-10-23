import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/settings/models/settings_menu_list.dart';
import 'package:pronet_storeroom_v_01/widgets/menu_icon_button_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 40,
      ),
      SizedBox(
        height: 700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: settingMenuList
                    .map((button) => Column(
                          children: [
                            MenuIconButtonWidget(
                              name: button['name'] ?? '',
                              path: button['path'] ?? '',
                              parent: button['parent'] ?? '',
                              icon: button['icon'] ??
                                  Icons
                                      .ac_unit, // Предполагаем, что icon может быть частью button
                            ),
                            const Divider(),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
