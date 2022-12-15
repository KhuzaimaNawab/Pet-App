import 'package:flutter/material.dart';

class BuildOnboarding extends StatelessWidget {
  final String image;
  const BuildOnboarding({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Meet your animal needs here',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          image,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Get interesting promos here, register your account immediately so you can meet your animal needs.',
          style: TextStyle(fontWeight: FontWeight.w200, color: Colors.grey),
        ),
      ],
    );
  }
}
