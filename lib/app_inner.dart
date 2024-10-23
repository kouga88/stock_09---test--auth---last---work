import 'package:pronet_storeroom_v_01/router/router.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:pronet_storeroom_v_01/themes/theme.dart';

class AppInner extends StatelessWidget {
  AppInner({super.key});

  final _appRouter = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'ProNet STOCK',
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
        debugShowCheckedModeBanner: true,
        routerConfig: _appRouter);
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
