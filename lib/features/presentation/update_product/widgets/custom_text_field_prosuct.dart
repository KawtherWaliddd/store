import 'package:flutter/material.dart';

class CustomTextFieldproduct extends StatelessWidget {
  const CustomTextFieldproduct({
    super.key,
    required this.input,
    required this.onChanged,
    required this.keyBoardType,
    this.controller,
  });

  final String input;
  final TextInputType keyBoardType;
  final Function(String input) onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyBoardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: input,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
