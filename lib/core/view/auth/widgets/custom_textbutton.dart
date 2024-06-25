import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

class CustomTextButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color backgroundColor;

  const CustomTextButton(
      {super.key,
      required this.icon,
      required this.title,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          foregroundColor: theme.colorScheme.onPrimary,
          minimumSize: const Size(145, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimary),
          )
        ],
      ),
    );
  }
}
