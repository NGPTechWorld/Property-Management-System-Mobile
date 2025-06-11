import 'package:flutter/material.dart';

class SlidingPageRouteBuilder<T> extends MaterialPageRoute<T> {
  SlidingPageRouteBuilder({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOutCubic,
        ),
      ),
      child: child,
    );
  }
}
