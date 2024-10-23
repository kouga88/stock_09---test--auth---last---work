// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorNotFoundPage extends StatelessWidget {
  const ErrorNotFoundPage({super.key, required this.errorMessage});

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
              height: 150,
            ),
            Image.asset(
              "images/404.png",
              height: 500.0,
              width: 500.0, // ширина изображения
            ),
            Text(
              'Страница не найдена!',
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
