import 'package:flutter/material.dart';
import 'package:mechalodon_mobile/components/buttons/primary_button.dart';
import 'package:mechalodon_mobile/styles/style.dart';

class LoginViewMobile extends StatefulWidget {
  const LoginViewMobile({Key? key}) : super(key: key);

  @override
  State<LoginViewMobile> createState() => _LoginViewMobileState();
}

class _LoginViewMobileState extends State<LoginViewMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _passwordVisible = true;

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
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Email Address"),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          decoration: MechBorder.inputField('Email'),
                          validator: isEmail,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Password"),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Password",
                              fillColor: Colors.white70,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible ?
                                    Icons.visibility_off : Icons.visibility,
                                  color: MechColor.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              )),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MechActionButton(
                        title: "Login",
                        onTap: () {
                          print("Register");
                        },
                      ),
                      const SizedBox(
                        height: 19,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('or'),
                          TextButton(
                            child: const Text(
                              "Create Account",
                              style: MechTextStyle.secondaryButton,
                            ),
                            onPressed: () {
                              _formKey.currentState!.validate();;
                            },
                          ),
                        ],
                      )
                    ],
                  )
                ])),
      ),
    );
  }

  String? isEmail(String? email) {
    if (email == null) return "email must not be blank";
    if (email.contains('@')) return null;
    return "Invalid Email";
  }
}
