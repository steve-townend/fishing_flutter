import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double maxWidth;


  const StyledButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.maxWidth
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        width: maxWidth,
        child: MouseRegion(
          cursor: MaterialStateMouseCursor.clickable,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xCC4F7942),
                borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
              )
            ),
          ),
        ),
      ),
    );
  }

}