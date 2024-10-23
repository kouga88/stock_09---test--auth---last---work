import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/page_title.dart';

import 'package:pronet_storeroom_v_01/themes/theme.dart';

class MainLayout extends StatelessWidget {
  final Widget content;

  const MainLayout({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final title = GoRouterState.of(context).name;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      margin: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Row(
                children: [
                  PageTitleWidget(
                    title: title.toString(),
                    widget: '',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            content,
          ],
        ),
      ),
    );
  }
}
