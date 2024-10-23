import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class AppInnerError extends StatelessWidget {
  const AppInnerError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pronet Storeroom',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      theme: mainTheme,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                  'К сожалению сейчас сервис не доступен! Попробуйте зайти позже!'),
              Text('Дополнительное описание: $message'),
            ],
          ),
        ),
      ),
    );
  }
}
