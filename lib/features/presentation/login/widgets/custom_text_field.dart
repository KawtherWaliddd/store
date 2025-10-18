import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.isPassword,
    required this.textController,
  });
  final TextEditingController textController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "can't be null";
        }
        return null;
      },
      controller: widget.textController,
      obscureText: widget.isPassword && !isVisible,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.isPassword ? Icons.password : Icons.email),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              )
            : null,
        hintText: widget.isPassword
            ? "Enter your password"
            : "Enter your email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
