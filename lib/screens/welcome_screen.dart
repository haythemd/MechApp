import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/components/buttons/primary_button.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                      Text(
                        "Welcome",
                        style: MechTextStyle.subtitle,
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
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MechActionButton(
                        title: "Login",
                        onTap: () {},
                        isPrimary: false,
                      ),
                      const SizedBox(height: 19,),
                      TextButton(
                        child: const Text("Try it out now!",style: MechTextStyle.secondaryButton,),
                        onPressed: () {},
                      )
                    ],
                  )
                ])),
      ),
    );
  }
}
