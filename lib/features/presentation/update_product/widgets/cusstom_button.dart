import 'package:flutter/material.dart';

class CusstomButton extends StatelessWidget {
  const CusstomButton({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      height: 60,
      minWidth: double.infinity,
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
