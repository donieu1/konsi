import 'package:flutter/material.dart';

class RemoveGlowEffect extends ScrollBehavior {
  const RemoveGlowEffect();

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
