// ignore_for_file: no_leading_underscores_for_local_identifiers


import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Function(dynamic)? onSaved;

  const FormTextField({
    super.key,
    required this.initialValue,
    required this.hintText,
    required this.readOnly,
    required this.validator,
    required this.onSaved
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SizedBox(
        child: TextFormField(
          validator: validator,
          enabled: !readOnly,
          initialValue: initialValue,
          onSaved: (newValue) => {
            onSaved!(newValue)
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 8, right: 8),
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