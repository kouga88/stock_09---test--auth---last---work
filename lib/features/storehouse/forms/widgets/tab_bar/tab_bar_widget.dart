// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/common/buttons/segmentButton/segment_button_model.dart';
import 'package:pronet_storeroom_v_01/common/buttons/segmentButton/segment_button_widget.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/widgets/tab_bar/tab_bar_content_widget.dart';

class FormTabBarWidget extends StatefulWidget {
  const FormTabBarWidget({super.key});

  @override
  State<FormTabBarWidget> createState() => _FormTabBarWidgetState();
}

class _FormTabBarWidgetState extends State<FormTabBarWidget> {
  String _activeView = 'Поступления';

  void _changeView(String title) {
    setState(() {
      _activeView = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var button in SegmentMenuList)
              SegmentButtonWidget(
                button: button,
                isActive: _activeView == button.title,
                onTap: () => _changeView(button.title),
              )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        TabContentWidget(
          title: _activeView,
        ),
      ],
    );
  }
}

final List<SegmentButton> SegmentMenuList = [
  SegmentButton(
    title: 'Поступления',
    selectedIcon: Symbols.deployed_code_update,
    isFirst: true,
    isLast: false,
  ),
  SegmentButton(
    title: 'Расход',
    selectedIcon: Symbols.directions_alt,
    isFirst: false,
    isLast: false,
  ),
  SegmentButton(
    title: 'Возможности',
    selectedIcon: Symbols.note_stack,
    isFirst: false,
    isLast: true,
  ),
];
