import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanagment/core/view/forgetPassword/set_password_screen.dart';

import '../common/widgets/background_image.dart';
import '../common/widgets/bottom_text.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_style.dart';
import '../login/login_screen.dart';


class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({super.key});

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PIN Verification",
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "A 6 digit verification pin will send to your email address",
              style: subtitleTextStyle,
            ),
            //pin verification feild

            const SizedBox(
              height: 25,
            ),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                //pin code border color
                activeColor: Colors.white,
                inactiveColor: Colors.black45,
                selectedColor: Colors.black45,
                //background color pin feild

                activeFillColor:Colors.white,
                inactiveFillColor: Colors.white,
                selectedFillColor: Colors.white70,

                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              controller: pinController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);
              },
              appContext: context,
            ),
            const SizedBox(
              height: 20,
            ),

            ReuseableElevatedButton(text: "Verify",onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetPasswordScreen()));


            }),
            const SizedBox(
              height: 30,
            ),
            //reuse bottom text
            BottomText(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (
                      context) => const LoginScreen()), (
                      route) => false);
                },
                buttonText: "Sign in",
                firstText: "Have Account?")

          ],
        ),
      ))),
    );
  }
}
