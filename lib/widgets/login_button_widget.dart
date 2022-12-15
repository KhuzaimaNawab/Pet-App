import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String buttonName;
  const LoginButton({super.key, required this.icon, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide.none,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            Icon(icon),
            Text(
              buttonName,
              style: const TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
