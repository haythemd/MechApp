import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/modules/reset_password/enter_new_password/bloc/reset_password_bloc.dart';
import 'package:mechalodon_mobile/styles/style.dart';

import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/navigation/app_link.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';
import 'package:mechalodon_mobile/utils/validators.dart';

class ResetPasswordMobileView extends StatefulWidget {
  const ResetPasswordMobileView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordMobileView> createState() =>
      _ResetPasswordMobileViewState();
}

class _ResetPasswordMobileViewState extends State<ResetPasswordMobileView> {
  void resetPassword(String email, String password) {
    BlocProvider.of<ResetPasswordBloc>(context)
        .add(ResetPassword(email: email, password: password));
  }

  var s = serviceLocator<S>();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool noMatch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container()),
      body: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
          builder: (context, state) {
        if (state is ResetPasswordSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

            context.go(MechPage.login.pathWithId("id"));
          });
        }
        return Stack(
          children: [
            (state is ResetPasswordInitial)
                ? Padding(
                    padding: MechPadding.defaultGlobalPadding,
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
                                          color: const Color(0x425BFD0D)
                                              .withOpacity(0.05))
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
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            s.resetPasswordBannerText,
                            style: MechTextStyle.title,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                              padding: const EdgeInsets.only(top: 54),
                              child: Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                       Text(
                                       s.enterNewPasswordText,
                                        style: MechTextStyle.label,
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                              height: 60,
                                              padding: const EdgeInsets.only(
                                                  left: 18, top: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    MechBorderRadius.radius,
                                              )),
                                          TextFormField(
                                            style: MechTextStyle.label
                                                .copyWith(height: 2.0),
                                            validator: MechValidators
                                                .isValidPassword,
                                            controller: password,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              errorBorder:
                                                  MechBorder.errorBorder,
                                              focusedBorder:
                                                  MechBorder.enabledBorder,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 20),
                                            ),
                                            obscureText: true,
                                          ),
                                        ],
                                      ),
                                       Padding(
                                        padding: const EdgeInsets.only(top: 18.0),
                                        child: Text(
                                          s.reEnterNewPasswordText,
                                          style: MechTextStyle.label,
                                        ),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                              height: 60,
                                              padding: const EdgeInsets.only(
                                                  left: 18, top: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade200,
                                                borderRadius:
                                                    MechBorderRadius.radius,
                                              )),
                                          TextFormField(
                                            style: MechTextStyle.label
                                                .copyWith(height: 2.0),
                                            validator: (String? value) {
                                              if (value =="") {
                                                setState(() {
                                                  noMatch =true;
                                                });
                                                return s.blankPasswordErrorMessage;
                                              }
                                              if (value != password.text) {
                                                setState(() {
                                                  noMatch = true;
                                                });
                                                return s
                                                    .passwordConfirmationError;
                                              } else {
                                                setState(() {
                                                  noMatch = false;
                                                });
                                                return s.passwordMatched;
                                              }

                                            },
                                            controller: confirmPassword,
                                            decoration: InputDecoration(
                                              errorStyle: MechTextStyle.label
                                                  .copyWith(
                                                      color: noMatch
                                                          ? MechColor.error
                                                          : MechColor
                                                              .success),
                                              border: InputBorder.none,
                                              errorBorder: noMatch
                                                  ? MechBorder.errorBorder
                                                  : MechBorder.successBorder,
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 20),
                                            ),
                                            obscureText: true,
                                          ),
                                          Positioned(
                                            right: 24,
                                            top: 20,
                                            child: noMatch
                                                ? SvgPicture.asset(
                                                    'assets/icons/alert_icon.svg',
                                                    color: MechColor.error)
                                                : SvgPicture.asset(
                                                    "assets/icons/success_icon.svg",
                                                    color: confirmPassword
                                                                .text ==
                                                            ''
                                                        ? Colors.transparent
                                                        : MechColor.success,
                                                  ),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () async => {
                                          _formKey.currentState!.validate(),
                                          Future.delayed(Duration(seconds: 1),
                                              () async {
                                            if (password.text ==
                                                confirmPassword.text && password.text!="") {

                                              resetPassword(
                                                  'userID', password.text);
                                              await Future.delayed(
                                                  Duration(seconds: 2), () {

                                              });
                                            }
                                          })
                                        },
                                        child: Container(
                                          width: 340,
                                          height: 60,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 18, vertical: 60),
                                          decoration: MechButtonStyle.primary,
                                          child:  Center(
                                            child: Text(
                                              s.submitButtonText,
                                              style:
                                                  MechTextStyle.primaryButton,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  )
                : Container(),
            (state is ResetPasswordLoading)
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: MechLoadingWidget(),
                    ),
                  )
                : Container(),
            (state is ResetPasswordError)
                ? Text(
                    state.message,
                    style:
                        const TextStyle(color: MechColor.error, fontSize: 15),
                  )
                : Container(),
          ],
        );
      }),
    );
  }
}
