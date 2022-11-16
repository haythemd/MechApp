import 'package:flutter/material.dart';

class MechTextStyle {
  static const title = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      fontFamily: 'Urbanist',
      color: Colors.black);

  static const subtitle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: 'Urbanist',
      color: Colors.black);

  static const label = TextStyle(
      fontFamily: 'Helvetica',
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: MechColor.labelColor);

  static const primaryButton = TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 17,
      fontWeight: FontWeight.w700,
      color: MechColor.lightPrimary);

  static const secondaryButton = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: MechColor.primary);
}

class MechColor {
  static const primary = Colors.black;
  static const lightPrimary = Colors.white;
  static const foreground = Color.fromRGBO(244, 244, 248, 1);
  static const error = Color.fromRGBO(255, 0, 0, 1);
  static const inactive = Colors.grey;
  static const link = Colors.black87;
  static const labelColor = Color(0xFF515151);
}

class MechInputStyle {
  static const primary = BoxDecoration(
      borderRadius: MechBorderRadius.radius, color: Color(0xFFF4F4F8));
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
  static const int value = 15;
  static const BorderRadius radius = BorderRadius.all(Radius.circular(15));
}

class MechBorder {
  static final primary = Border.all(width: 2, color: MechColor.primary);

  static InputDecoration inputStyle(String hintText) {
    return InputDecoration(
        border: MechBorder.enabledBorder,
        enabledBorder: MechBorder.enabledBorder,
        errorBorder: MechBorder.errorBorder,
        focusedBorder: MechBorder.enabledBorder,
        filled: true,
        hintStyle: const TextStyle(color: MechColor.inactive),
        hintText: hintText,
        fillColor: MechColor.foreground);
  }

  static const enabledBorder = OutlineInputBorder(
    borderRadius: MechBorderRadius.radius,
    borderSide: BorderSide(color: Colors.transparent),
  );

  static const errorBorder = OutlineInputBorder(
    borderRadius: MechBorderRadius.radius,
    borderSide: BorderSide(color: MechColor.error),
  );
}

class MechPadding {
  static const defaultLeftPadding = EdgeInsets.only(left: 18);
  static const defaultVerticalPadding = EdgeInsets.symmetric(vertical: 18);
}
