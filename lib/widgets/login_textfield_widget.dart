import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obsureText;
  final String? Function(String?)? validator;
  const LoginTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.obsureText = false, required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
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
