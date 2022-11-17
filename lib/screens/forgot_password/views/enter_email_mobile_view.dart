import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class EnterEmailMobileView extends StatelessWidget {
  EnterEmailMobileView({Key? key, this.userEmail = ""}) : super(key: key);

  final String? phoneNumber;
  late final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MechColor.background,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: MechColor.backButtonBorder,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(color: MechColor.foreground, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.chevron_left),
                    color: MechColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
