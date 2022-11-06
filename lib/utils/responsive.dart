import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {Key? key,
      required this.mobile,
      required this.desktop,
      required this.tablet})
      : super(key: key);

  final int _mobile = 680;
  final int _tablet = 850;
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < _mobile) {
      return mobile;
    } else if (MediaQuery.of(context).size.width > _mobile &&
        (MediaQuery.of(context).size.width < _tablet)) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
