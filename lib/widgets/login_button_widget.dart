import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final IconData icon;
  final String buttonName;
  const LoginButton({super.key, required this.icon, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        side: const BorderSide(
          width: 1,
          color: Colors.grey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              buttonName,
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
