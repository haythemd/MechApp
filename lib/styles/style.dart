import 'package:flutter/material.dart';

class MechTextStyle {
  static const title = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static const subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const primaryButton = TextStyle(
      fontSize: 17, fontWeight: FontWeight.bold, color: MechColor.lightPrimary);

  static const secondaryButton = TextStyle(
      fontSize: 17, fontWeight: FontWeight.bold, color: MechColor.primary);
}

class MechColor {
  static const primary = Colors.black;
  static const lightPrimary = Colors.white;
}

class MechButtonStyle {
  static const primary = BoxDecoration(
      borderRadius: MechBorderRadius.radius, color: MechColor.primary);

  static final secondary = BoxDecoration(
      border: MechBorder.primary,
      borderRadius: MechBorderRadius.radius,
      color: MechColor.lightPrimary);
}

class MechBorderRadius {
  static const int value = 20;
  static const BorderRadius radius = BorderRadius.all(Radius.circular(20));
}

class MechBorder {
  static final primary = Border.all(width: 2, color: MechColor.primary);
}
