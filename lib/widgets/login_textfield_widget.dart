import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsureText;
  const LoginTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.obsureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obsureText,
      style: const TextStyle(
        color: Color(0xFFFD9340),
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        focusColor: const Color(0xFFFD9340),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 10,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.all(24),
      ),
    );
  }
}
