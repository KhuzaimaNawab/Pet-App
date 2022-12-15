import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    var sizedBox20 = const SizedBox(
      height: 20,
    );
    const lightColorText =
        TextStyle(fontWeight: FontWeight.w200, color: Colors.grey);
    var sizedBox40 = const SizedBox(
      height: 40,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Hello,\nWelcome Back!',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            sizedBox20,
            const Text(
              'Water is life. Water is a basic human need. In various lines of life, humans need water.',
              style: lightColorText,
            ),
            sizedBox20,
            LoginTextField(
              label: 'Email',
              controller: _email,
              keyboardType: TextInputType.emailAddress,
            ),
            sizedBox20,
            LoginTextField(
              label: 'Password',
              controller: _pass,
              keyboardType: TextInputType.name,
              obsureText: true,
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
              children: const [
                LoginButton(icon: Icons.facebook, buttonName: 'Google'),
                LoginButton(icon: Icons.facebook, buttonName: 'Facebook'),
              ],
            ),
          ],
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
