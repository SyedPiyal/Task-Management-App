import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.keyboardType,
      this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none),
        fillColor: Colors.blue.withOpacity(0.1),
        filled: true,
        prefixIcon: prefixIcon,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
