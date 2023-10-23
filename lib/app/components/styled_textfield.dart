// ignore_for_file: no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final double maxWidth;
  final bool isUsername;
  final bool isPassword;
  
  StyledTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.maxWidth,
    required this.isUsername,
    required this.isPassword
  }) {
    if (isUsername) {
      _autofillHints.add(AutofillHints.username);
    }

    if (isPassword) {
      _autofillHints.add(AutofillHints.password);
    }
  }

  final List<String> _autofillHints = List<String>.empty(growable: true);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: maxWidth,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          autofillHints: _autofillHints,
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