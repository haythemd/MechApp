import 'package:flutter/material.dart';

class MechLoadingWidget extends StatefulWidget {
  const MechLoadingWidget({Key? key}) : super(key: key);

  @override
  State<MechLoadingWidget> createState() => _MechLoadingWidgetState();
}

class _MechLoadingWidgetState extends State<MechLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}