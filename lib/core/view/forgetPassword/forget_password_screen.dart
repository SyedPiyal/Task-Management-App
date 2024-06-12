import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/forgetPassword/pin_verification_screen.dart';
import '../common/widgets/background_image.dart';
import '../common/widgets/bottom_text.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_feild_style.dart';
import '../common/widgets/text_style.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
          child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //heading for forget password screen
                Text(
                  "Your Email Address",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                    "A 6 digit verification pin will send to your email address",
                    style: subtitleTextStyle),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: emailController,

                  //textFeild decoration using reuseable widget
                  decoration: textFeildStyle("Email"),
                  validator: (String? text) {
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ReuseableElevatedButton(onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PinVerificationScreen()));
                }),
                const SizedBox(
                  height: 35,
                ),
                //bottom text reuseable text
                BottomText(
                    //signin button ontap
                    onTap: () {
                      Navigator.pop(context);
                    },
                    //button text
                    buttonText: "Sign in",
                    //signin button previous text
                    firstText: "Have account?")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
