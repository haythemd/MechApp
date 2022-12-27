import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:go_router/go_router.dart';

class MechWidgets {
  static AppBar appBar({required String title,
    required BuildContext context,
    bool showBackButton = true, Widget? trailing}) {
    {
      return AppBar(
        toolbarHeight: 80,
        titleSpacing: 0,
        leadingWidth: 100,
        leading:
        // created a rounded back chevron button that is black but 3% opacity 1 pixel border
        showBackButton
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.black.withOpacity(0.03),
                  width: 1,
                ),
              ),
              child: InkWell(
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    Icons.chevron_left,
                    color: MechColor.primary,
                  ),
                  onTap: () => context.pop()),
            ),
          ],
        )
            : null,
        title: Text(
          title,
          style: MechTextStyle.subtitle,

        ),
        centerTitle: true,
        actions: trailing == null ? [] : [trailing],
      );
    }
  }
}
