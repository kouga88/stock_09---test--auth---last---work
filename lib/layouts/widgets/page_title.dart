import 'package:flutter/material.dart';

class PageTitleWidget extends StatelessWidget {
  const PageTitleWidget({super.key, required this.title, required this.widget});

  final String title;
  final String widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: theme.textTheme.displayMedium,
              ),
            ),
          ],
        )
      ],
    );
  }
}
