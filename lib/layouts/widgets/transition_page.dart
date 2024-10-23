import 'package:pronet_storeroom_v_01/layouts/empty_layout.dart';
import 'package:pronet_storeroom_v_01/layouts/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Page<void> buildPageWithTransition(
  Widget widget,
  bool isEmpty,
) {
  return CustomTransitionPage<void>(
    key: ValueKey(widget.toString()),
    child: widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.1, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      final tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: isEmpty
            ? EmptyLayout(content: child)
            : MainLayout(
                content: child,
              ),
      );
    },
  );
}
