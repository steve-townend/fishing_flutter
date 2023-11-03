import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({super.key, required this.items, required this.onChanged});

  final List<DropdownItem> items;
  final Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: DropdownButtonFormField(
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
              hintStyle: TextStyle(color: Colors.grey[400])
            ),
        value: items.first,
        onChanged: (newValue) => {
            onChanged!(newValue)
          },
        items: items.map((DropdownItem item) {
          return DropdownMenuItem<DropdownItem>(value: item, child: Text(item.value));
        }).toList(),
      ),
    );
  }
}

class DropdownItem {
  int id;
  String value;

  DropdownItem ({
    required this.id,
    required this.value
  });
}