import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class MechActionButton extends StatelessWidget {
  const MechActionButton({
    required this.title,
    required this.onTap,
    this.isPrimary = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  /// If true then the buttons main color will be primary.
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: isPrimary ? MechButtonStyle.primary : MechButtonStyle.secondary,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: isPrimary ? MechTextStyle.primaryButton : MechTextStyle.secondaryButton,
          ),
        ),
      ),
    );
  }
}
