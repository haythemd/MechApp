import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/confirmation_screen/bloc/reset_password_code_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class ConfirmationCodeMobileView extends StatefulWidget {
  const ConfirmationCodeMobileView({Key? key}) : super(key: key);

  @override
  State<ConfirmationCodeMobileView> createState() =>
      _ConfirmationCodeMobileViewState();
}

class _ConfirmationCodeMobileViewState
    extends State<ConfirmationCodeMobileView> {
  Timer timer = Timer(Duration(seconds: 2),(){});
  bool hasError = false;
  String currentText = '';
  var s = serviceLocator<S>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container()),
      body: BlocBuilder<ConfirmationCodeBloc, ConfirmationCodeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      // Pop Page here
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
                                  color:
                                      const Color(0x425BFD0D).withOpacity(0.05))
                            ]),
                        child: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        ))),
                const SizedBox(
                  height: 56,
                ),
                 Text(
                  s.resetPasswordText,
                  style: MechTextStyle.subtitle,
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    s.resetPasswordBannerText,
                    style: MechTextStyle.title,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 30),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: MechTextStyle.primaryButton,
                        length: 4,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,

                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: MechBorderRadius.radius,
                            fieldHeight: 76,
                            fieldWidth: 60,
                            inactiveFillColor: const Color(0xFFF4F4F8),
                            selectedFillColor: const Color(0xFFF4F4F8),
                            activeFillColor: const Color(0xFFF4F4F8),
                            inactiveColor: const Color(0xFFF4F4F8),
                            activeColor: const Color(0xFFF4F4F8),
                            selectedColor: const Color(0xFFF4F4F8)),
                        cursorColor: Colors.black,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: codeController,
                        keyboardType: TextInputType.number,

                        onCompleted: (v) {
                          debugPrint("Completed");
                          //Send Request Here!!!!! Alter State and do some shit!
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          debugPrint(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          debugPrint("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    hasError ? "*Please fill up all the cells properly" : "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Didn't get a code? ",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () => print("OTP resend!!"),
                        child: Text(s.resendButtonText,
                            style: MechTextStyle.secondaryButton.copyWith()))
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Container(
                        height: 60,
                        width: 165,
                        decoration: const BoxDecoration(
                          borderRadius: MechBorderRadius.radius),
                        child:  Center(child: Text(s.backButtonText)),
                      ),
                    Container(
                      height: 60,
                      width: 165,
                      decoration: const BoxDecoration(color: Colors.black,
                          borderRadius: MechBorderRadius.radius),
                      child:  Center(child: Text(s.nextButtonText,style: MechTextStyle.primaryButton,)),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
