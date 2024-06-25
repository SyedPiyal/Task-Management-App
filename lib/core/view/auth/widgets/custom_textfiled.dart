import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

import '../../../../utils/colors/palette.dart';

class CustomTextFiled extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final TextEditingController? controller;

  const CustomTextFiled({super.key,
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail, this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller:controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: theme.colorScheme.onTertiary,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.surfaceVariant,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.surfaceVariant,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.surfaceVariant,
          ),
        ),
      ),
    );
  }
}
