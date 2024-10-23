import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/features/storehouse/forms/widgets/tab_bar/tab_bar_widget.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        FormTabBarWidget()
      ],
    );
  }
}
