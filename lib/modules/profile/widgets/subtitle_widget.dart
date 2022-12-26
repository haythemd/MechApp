import 'package:flutter/material.dart';

import 'package:mechalodon_mobile/styles/style.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  const SubtitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        children: [
          Text(
            title,
            style: MechTextStyle.subheading3
                .copyWith(color: const Color(0xFF0A0615)),
          ),
          Expanded(
              child: SizedBox(
                height: 16,
                child: Column(
                  children: [
                    Divider(
                      color: Colors.black.withOpacity(0.1),
                      indent: 9,
                      endIndent: 0,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
