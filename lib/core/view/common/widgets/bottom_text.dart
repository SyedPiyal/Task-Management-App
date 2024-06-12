import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';

class BottomText extends StatelessWidget {
  //fist text is previous text in button text
  final String firstText;

  //onTap is button ontap function
  final VoidCallback onTap;

  //button text is button text
  final String buttonText;

  const BottomText({
    super.key,
    required this.onTap,
    required this.buttonText,
    required this.firstText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //text
        Text(
          firstText,
          style: theme.textTheme.bodyMedium,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              buttonText,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary),
            ))
      ],
    );
  }
}
