import 'package:flutter/material.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';
import 'custom_textfiled.dart';

class SignUpContainer extends StatelessWidget {
  final bool isMale;
  final VoidCallback onTap;
  final VoidCallback onTap1;

  const SignUpContainer(
      {super.key,
      required this.isMale,
      required this.onTap,
      required this.onTap1});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          const CustomTextFiled(
            icon: Icons.account_circle,
            hintText: "User Name",
            isPassword: false,
            isEmail: false,
          ),
          const CustomTextFiled(
            icon: Icons.email_outlined,
            hintText: "email",
            isPassword: false,
            isEmail: true,
          ),
          const CustomTextFiled(
            icon: Icons.lock_outline,
            hintText: "password",
            isPassword: true,
            isEmail: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? theme.colorScheme.onSurfaceVariant : Colors.transparent,
                          border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Colors.transparent
                                  : theme.colorScheme.surfaceVariant),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: isMale
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onTertiary,
                        ),
                      ),
                       Text(
                        "Male",
                        style: TextStyle(
                          color: theme.colorScheme.surfaceVariant,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: onTap1,
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : theme.colorScheme.onSurfaceVariant,
                          border: Border.all(
                            width: 1,
                            color: isMale
                                ? theme.colorScheme.surfaceVariant
                                : Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: isMale
                              ? theme.colorScheme.onTertiary
                              : theme.colorScheme.onPrimary,
                        ),
                      ),
                       Text(
                        "Female",
                        style: TextStyle(
                          color: theme.colorScheme.surfaceVariant,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.only(top: 20),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "By pressing 'Submit' you agree to our ",
                  style: TextStyle(
                    color: theme.colorScheme.surfaceVariant,
                  ),
                  children: [
                    TextSpan(
                      //recognizer: ,
                      text: "term & conditions",
                      style: TextStyle(
                        color: theme.colorScheme.onInverseSurface,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
