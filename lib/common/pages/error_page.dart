// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: Icon(Icons.arrow_back),
                tooltip: 'Назад',
              )
            ],
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            SvgPicture.asset(
              "images/400.svg",
              width: 400,
              height: 400,
            ),
            Text(
              'Что-то пошло не так!',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Text(
              errorMessage,
              style: theme.textTheme.labelSmall,
            ),
          ],
        ))
      ],
    );
  }
}
