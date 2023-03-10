import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/view/register_screen.dart';
import 'package:pet_app/widgets/login_button_widget.dart';
import 'package:pet_app/widgets/login_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var sizedBox30 = const SizedBox(
      height: 30,
    );
    const lightColorText =
        TextStyle(fontWeight: FontWeight.w200, color: Colors.grey);
    var sizedBox40 = const SizedBox(
      height: 40,
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
                  'Hello,\nWelcome Back!',
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
                      sizedBox30,
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
                    ],
                  ),
                ),
                sizedBox40,
                Row(
                  children: [
                    divider(),
                    const Text('or', style: lightColorText),
                    divider(),
                  ],
                ),
                sizedBox40,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    LoginButton(icon: Icons.facebook, buttonName: '  Google'),
                    SizedBox(
                      width: 20,
                    ),
                    LoginButton(icon: Icons.facebook, buttonName: '  Facebook'),
                  ],
                ),
                sizedBox40,
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an acouunt? ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Create an Account',
                        style: const TextStyle(
                          color: Color(0xFFFD9340),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
                sizedBox40,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate();
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

  Expanded divider() {
    return const Expanded(
      child: Divider(
        color: Colors.grey,
        thickness: 0.5,
        height: 30,
        indent: 50,
        endIndent: 50,
      ),
    );
  }
}
