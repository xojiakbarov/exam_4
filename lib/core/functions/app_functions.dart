
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
CupertinoPageRoute fade(Widget widget) {
  return CupertinoPageRoute(
    builder: (context) {
      return widget;
    },
  );

  // return PageRouteBuilder(
  //   transitionsBuilder: (_, __, ___, child) {
  //
  //     return FadeTransition(
  //       opacity: opacity,
  //       child: child,
  //     );
  //   },
  //   pageBuilder: (_, __, ___) {
  //     return widget;
  //   },
  // );
}