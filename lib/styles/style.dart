import 'package:flutter/material.dart';

class MechTextStyle {
  static const title = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      fontFamily: 'Urbanist',
      color: Colors.black);
  
    static const titleMetric = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: 'Helvetica',
      color: Colors.black);

    static const titleBodyMetric = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: 'Helvetica',
      color: Colors.black);

  static const subtitle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      fontFamily: 'Urbanist',
      color: Colors.black);
  
  static const subheading5 = TextStyle(
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: MechColor.labelColor);

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

    static const h5 = TextStyle(
      fontFamily: 'Helvetica',
      fontSize: 12,
      letterSpacing: .5,
      fontWeight: FontWeight.w700,
      color: MechColor.lightPrimary);

  static const secondaryButton = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: MechColor.primary);
}

class MechColor {
  static const primary = Colors.black;
  static const lightPrimary = Colors.white;
  static const foreground = Color.fromRGBO(244, 244, 248, 1);
  static const background = Colors.white;
  static const error = Color.fromRGBO(245, 44, 86, 1);
  static const inactive = Colors.grey;
  static const link = Colors.black87;
  static const backButtonBorder = Color.fromRGBO(0, 0, 0, .03);
  static const labelColor = Color(0xFF515151);
  static const success = Color(0xFF3C9705);
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
  static const successBorder = OutlineInputBorder(
    borderRadius: MechBorderRadius.radius,
    borderSide: BorderSide(color: MechColor.success),
  );
}

class MechPadding {
  static const defaultLeftPadding = EdgeInsets.only(left: 18);
  static const defaultVerticalPadding = EdgeInsets.symmetric(vertical: 18);
  static const defaultGlobalPadding = EdgeInsets.symmetric(horizontal: 18);
}
