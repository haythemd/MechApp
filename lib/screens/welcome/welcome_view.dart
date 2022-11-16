import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/components/buttons/primary_button.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class WelcomeViewMobile extends StatelessWidget {
  const WelcomeViewMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.chair,
                        size: 153,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Welcome",
                        style: MechTextStyle.subtitle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Make your ads work",
                        style: MechTextStyle.title,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MechActionButton(
                        title: "Register",
                        onTap: () {
                          Router;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MechActionButton(
                        title: "Login",
                        onTap: () {
                          context.go(MechPage.login.path());
                        },
                        isPrimary: false,
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      TextButton(
                        child: const Text(
                          "Try it out now!",
                          style: MechTextStyle.secondaryButton,
                        ),
                        onPressed: () {
                          print("Try it out");
                        },
                      )
                    ],
                  )
                ])),
      ),
    );
  }
}
