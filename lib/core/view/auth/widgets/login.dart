import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';
import 'custom_textfiled.dart';

class LoginContainer extends StatelessWidget {
  final bool isRememberMe;
  final Function() onChanged;
  final VoidCallback? onPressed;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const LoginContainer(
      {super.key,
      required this.isRememberMe,
      required this.onChanged,
      this.emailController,
      this.passwordController,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          CustomTextFiled(
            icon: Icons.mail_outline,
            hintText: "Enter Email",
            isPassword: false,
            isEmail: true,
            controller: emailController,
          ),
          CustomTextFiled(
            icon: Icons.lock_outline,
            hintText: "**********",
            isPassword: true,
            isEmail: false,
            controller: passwordController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: theme.colorScheme.onSurfaceVariant,
                    onChanged: (value) {
                      onChanged();
                    },
                  ),
                  Text(
                    "Remember me",
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.surfaceVariant,
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "Forgot Password?",
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: theme.colorScheme.surfaceVariant,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
