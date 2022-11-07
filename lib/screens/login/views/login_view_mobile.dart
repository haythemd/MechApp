import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/components/buttons/primary_button.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/screens/login/bloc/login_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({Key? key}) : super(key: key);

  @override
  State<LoginViewMobile> createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(String email, String password) {
    BlocProvider.of<LoginBloc>(context)
        .add(LoginUser(email: email, password: password));
  }

  var s = serviceLocator<S>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (state is LoginLoading) const CircularProgressIndicator(),
              SafeArea(
                child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.chair,
                                size: 153,
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                s.welcomeTitle,
                                style: MechTextStyle.subtitle,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                s.loginViewTitle,
                                style: MechTextStyle.title,
                              )
                            ],
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(s.emailAddressInputFieldTitle),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration:
                                      MechBorder.inputStyle(s.emailAddressInputFieldHintText),
                                  validator: isEmail,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(s.passwordInputFieldTitle),
                                const SizedBox(
                                  height: 6,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  obscureText: _passwordVisible,
                                  decoration: InputDecoration(
                                      border: MechBorder.enabledBorder,
                                      enabledBorder: MechBorder.enabledBorder,
                                      focusedBorder: MechBorder.enabledBorder,
                                      errorBorder: MechBorder.errorBorder,
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: MechColor.inactive),
                                      hintText: s.passwordInputFieldHintText,
                                      fillColor: MechColor.foreground,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: MechColor.inactive,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        },
                                      )),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: TextButton(
                                      onPressed: () {
                                        print('forgot password');
                                      },
                                      child: Text(
                                        s.resetPasswordButtonText,
                                        style: TextStyle(color: MechColor.link),
                                      )),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text(
                                  'Error account doesnt exist try entering other credentials',
                                  style: TextStyle(
                                      color: MechColor.error, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MechActionButton(
                                title: s.loginButtonTitle,
                                onTap: () {
                                  login(emailController.text,
                                      passwordController.text);
                                  _formKey.currentState!.validate();
                                },
                              ),
                              const SizedBox(
                                height: 19,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(s.or),
                                  TextButton(
                                    child: Text(
                                      s.createAccountButtonTitle,
                                      style: MechTextStyle.secondaryButton,
                                    ),
                                    onPressed: () {
                                      print("Register");
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ])),
              ),
            ],
          );
        },
      ),
    );
  }

  String? isEmail(String? email) {
    if (email == null) return s.blankEmailErrorMessage;
    if (email.contains('@')) return null;
    return s.invalidEmailError;
  }
}
