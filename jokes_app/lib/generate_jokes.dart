import 'package:flutter/material.dart';

class GenerateJokesButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GenerateJokesButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey),
        padding: WidgetStateProperty.all(const EdgeInsets.all(10.0)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: const Text(
        'Generate Jokes',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}