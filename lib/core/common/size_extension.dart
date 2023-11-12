import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get toPadding => MediaQuery.of(this).viewPadding.top;

  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  double convertForWidth(double size) =>
      (size / 390) * MediaQuery.of(this).size.width;

  double convertForHeight(double size) =>
      (size / 844) * MediaQuery.of(this).size.height;
}
