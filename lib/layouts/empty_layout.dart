import 'package:flutter/material.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class EmptyLayout extends StatelessWidget {
  final Widget content;

  const EmptyLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: backgroundColor,
      ),
      margin: const EdgeInsets.fromLTRB(0, 10, 20, 20),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content,
          ],
        ),
      ),
    );
  }
}
