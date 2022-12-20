import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/view/login_screen.dart';

import '../widgets/login_textfield_widget.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = 'regiser-screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _fullName = TextEditingController();
  bool isCheck = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sizedBox20 = const SizedBox(
      height: 20,
    );
    var sizedBox30 = const SizedBox(
      height: 30,
    );
    const lightColorText =
        TextStyle(fontWeight: FontWeight.w200, color: Colors.grey);
    var sizedBox40 = const SizedBox(
      height: 40,
    );
    var greyText =
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400);
    var orangeText = const TextStyle(
      color: Color(0xFFFD9340),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Create New Account',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                sizedBox30,
                const Text(
                  'Water is life. Water is a basic human need. In various lines of life, humans need water.',
                  style: lightColorText,
                ),
                sizedBox30,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginTextField(
                          label: 'Full Name',
                          controller: _fullName,
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            final RegExp nameRegExp = RegExp('[a-zA-Z]');
                            if (!nameRegExp.hasMatch(value!)) {
                              return 'Enter your name';
                            }
                          }),
                      sizedBox20,
                      LoginTextField(
                        label: 'Email',
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          const pattern =
                              r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                          final regExp = RegExp(pattern);

                          if (value!.isEmpty) {
                            return 'Enter an email';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      sizedBox20,
                      LoginTextField(
                        label: 'Password',
                        controller: _pass,
                        keyboardType: TextInputType.name,
                        obsureText: true,
                        validator: (value) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          if (value!.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              return 'Enter valid password';
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: isCheck,
                            onChanged: (value) {
                              setState(() {
                                isCheck = !isCheck;
                              });
                            },
                          ),
                          RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I Agree to the ",
                                  style: greyText,
                                ),
                                TextSpan(
                                  text: 'Terms of Service ',
                                  style: orangeText,
                                ),
                                TextSpan(text: "and\n", style: greyText),
                                TextSpan(
                                  text: 'Privacy Policy ',
                                  style: orangeText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                sizedBox40,
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Have an acoount?",
                        style: greyText,
                      ),
                      TextSpan(
                        text: ' Login',
                        style: orangeText,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
                sizedBox30,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (isCheck == false) {
                      const snackBar = SnackBar(
                        content: Text('Please check the terms & condition'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      final isValid = _formKey.currentState?.validate();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
