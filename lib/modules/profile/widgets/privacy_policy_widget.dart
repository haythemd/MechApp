import 'package:flutter/material.dart';

import '../../../styles/style.dart';

class InfoPagesButtons extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  const InfoPagesButtons({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  State<InfoPagesButtons> createState() => _InfoPagesButtonsState();
}

class _InfoPagesButtonsState extends State<InfoPagesButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.text,
              style: MechTextStyle.blackSmallTitle,
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
