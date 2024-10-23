import 'package:pronet_storeroom_v_01/common/pages/404_page.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/side_bar/side_bar.dart';
import 'package:pronet_storeroom_v_01/router/routes_list.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:pronet_storeroom_v_01/themes/theme.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/news',
    errorBuilder: (context, state) {
      return Scaffold(
        body: ErrorNotFoundPage(errorMessage: state.error.toString()),
      );
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            body: Column(
              children: [
                const HeaderWidget(),
                Expanded(
                  child: Stack(children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 120,
                        ),
                        Expanded(
                            child:
                                child), // Child will be the current route's content
                      ],
                    ),
                    const SideBar(),
                  ]),
                ),
              ],
            ),
          );
        },
        routes: routes,
      ),
      // Новости
    ],
  );
}
