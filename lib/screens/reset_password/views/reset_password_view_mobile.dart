import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class ResetPasswordMobileView extends StatefulWidget {
  const ResetPasswordMobileView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordMobileView> createState() =>
      _ResetPasswordMobileViewState();
}

class _ResetPasswordMobileViewState extends State<ResetPasswordMobileView> {
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container()),
      body: Padding(
        padding: MechPadding.defaultLeftPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {
                  /*Handle Navigating back*/ print("tapped");
                },
                child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: MechBorderRadius.radius,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 11,
                              color: const Color(0x425BFD0D).withOpacity(0.05))
                        ]),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ))),
            const SizedBox(
              height: 56,
            ),
            const Text(
              'Reset Password',
              style: MechTextStyle.subtitle,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                'Input Your\nAccount Details',
                style: MechTextStyle.title,
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 54),
                  child: Form(
                      child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter New Password",
                          style: MechTextStyle.label,
                        ),
                        SizedBox(
                            height: 60,
                            child: Container(
                              margin: const EdgeInsets.only(right: 18, top: 8),
                              padding: const EdgeInsets.only(left: 18,top: 8),
                              decoration: MechInputStyle.primary,
                              child: Center(
                                child: TextFormField(
                                  controller: password,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                  obscureText: true,
                                ),
                              ),
                            )),
                        const Text(
                          "Re Enter New Password",
                          style: MechTextStyle.label,
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 18, top: 8),
                            padding: const EdgeInsets.only(left: 18,top: 8),
                            decoration: MechInputStyle.primary,
                            height: 60,
                            child: Center(
                              child: TextFormField(
                                controller: confirmPassword,

                                decoration:
                                    const InputDecoration.collapsed(hintText: ''),
                                obscureText: true,
                              ),
                            )),
                        GestureDetector(
                          onTap: ()=> print('Aaslema'),
                          child: Container(
                            width: 340,
                            height: 60,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 100),
                            decoration: MechButtonStyle.primary,
                            child: const Center(
                              child:  Text(
                                'Submit',
                                style: MechTextStyle.primaryButton,
                                textAlign: TextAlign.center,

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
