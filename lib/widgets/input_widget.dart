import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final void Function()? onTap;

  InputWidget({
    required this.label,
    required this.controller,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: readOnly,
          onTap: onTap,
        ),
      ],
    );
  }
}