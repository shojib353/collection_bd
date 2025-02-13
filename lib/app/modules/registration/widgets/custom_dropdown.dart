import 'package:flutter/material.dart';

import '../model/divition.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<Data>? items;
  final String? value;
  final Function(String?) onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value?.isEmpty == true ? null : value,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
      icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.teal, size: 30),
      dropdownColor: Colors.white,
      style: TextStyle(color: Colors.black, fontSize: 16),
      isExpanded: true,
      items: items?.map((item) {
        return DropdownMenuItem(
          value: item.label,
          child: Text(
            item.label ?? '',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        );
      }).toList() ?? [],
      onChanged: onChanged,
      validator: (value) => value == null ? 'Please select $label' : null,
    );
  }
}
