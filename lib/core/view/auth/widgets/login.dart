import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/home/home_view.dart';
import '../../../../utils/colors/palette.dart';
import 'custom_textfiled.dart';

class LoginContainer extends StatelessWidget {
  final bool isRememberMe;
  final Function() onChanged;

  const LoginContainer(
      {super.key, required this.isRememberMe, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom:10),
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          const CustomTextFiled(
            icon: Icons.mail_outline,
            hintText: "Enter Email",
            isPassword: false,
            isEmail: true,
          ),
          const CustomTextFiled(
            icon: Icons.lock_outline,
            hintText: "**********",
            isPassword: true,
            isEmail: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isRememberMe,
                    activeColor: Palette.textColor2,
                    onChanged: (value) {
                      onChanged();
                    },
                  ),
                  const Text(
                    "Remember me",
                    style: TextStyle(fontSize: 12, color: Palette.textColor1),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(fontSize: 12, color: Palette.textColor1),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
