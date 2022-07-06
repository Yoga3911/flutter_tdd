import 'package:flutter/material.dart';
import 'package:my_project/app/core/constants/color.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  const MyTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        cursorColor: MyColor.red,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(
            color: MyColor.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: MyColor.red,
            ),
          ),
        ),
      ),
    );
  }
}
