
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:mechalodon_mobile/services/injectable.dart';

import 'package:mechalodon_mobile/generated/l10n.dart';

import '../../../styles/style.dart';

class MarketingPlatformIntegrationWidget extends StatefulWidget {
  final s = serviceLocator<S>();
  final String imagePath;
  final String socialPlatform;
  final bool integrated;
  final VoidCallback onPressed;
   MarketingPlatformIntegrationWidget({Key? key, required this.imagePath, required this.socialPlatform, required this.integrated, required this.onPressed}) : super(key: key);

  @override
  State<MarketingPlatformIntegrationWidget> createState() => _MarketingPlatformIntegrationWidgetState();
}

class _MarketingPlatformIntegrationWidgetState extends State<MarketingPlatformIntegrationWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SvgPicture.asset(widget.imagePath),
          ),
          Text(
            widget.socialPlatform,
            style: MechTextStyle.blackDescriptionTitle,
          ),
          Expanded(child: Container()),
          widget.integrated
              ? Padding(
              padding: const EdgeInsets.only(right: 46.0),
              child: SvgPicture.asset(
                  'assets/icons/success_icon_outlined.svg'))
              : Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              // Launch URL here or apply integrations logic
                onPressed: widget.onPressed,
                child: Text(
                  widget.s.connectNowButtonText,
                  style: MechTextStyle.blackDescriptionTitle.copyWith(
                      fontSize: 12, decoration: TextDecoration.underline),
                )),
          ),
        ],
      ),
    );
  }
}

