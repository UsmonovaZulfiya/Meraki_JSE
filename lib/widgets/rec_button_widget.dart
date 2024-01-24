import 'package:flutter/material.dart';

class recButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  recButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}
