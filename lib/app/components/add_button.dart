import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function()? onTap;


  const AddButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return 
      RawMaterialButton(
        onPressed: onTap,
        fillColor: const Color(0xFF4F7942),
        elevation: 8.0,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 40.0,
          color: Colors.white,
        ),
      );
  }

}