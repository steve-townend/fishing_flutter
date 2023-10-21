
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double maxWidth;

  const StyledTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.maxWidth
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: maxWidth,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400)
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400])
          ),
        ),
      ),
    );
  }

}