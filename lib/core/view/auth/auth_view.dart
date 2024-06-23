import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/auth/widgets/custom_textbutton.dart';
import 'package:taskmanagment/core/view/auth/widgets/login.dart';
import 'package:taskmanagment/core/view/auth/widgets/middle_container.dart';
import 'package:taskmanagment/core/view/auth/widgets/signup.dart';
import '../../../utils/colors/palette.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          //--------------> top container for welcome text <--------------//

          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 90, left: 20, bottom: 20),
              color: const Color(0xFF3b5999).withOpacity(.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Welcome to",
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 2,
                          color: Colors.yellow[700],
                        ),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? " Task Manager" : " Back,",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[700],
                            ),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    isSignupScreen ? "Signup to Continue" : "Login to Continue",
                    style: const TextStyle(
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          MiddleContainer(
            showShadow: true,
            isSignupScreen: isSignupScreen,
          ),
          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen)
                      SignUpContainer(
                        isMale: isMale,
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        onTap1: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                      ),
                    if (!isSignupScreen)
                      LoginContainer(
                        isRememberMe: isRememberMe,
                        onChnaged: () {
                          setState(() {
                            isRememberMe = !isRememberMe;
                          });
                        },
                      )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          MiddleContainer(
            showShadow: false,
            isSignupScreen: isSignupScreen,
          ),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "Or Signup with" : "Or Login with"),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        icon: Icons.facebook,
                        title: "Facebook",
                        backgroundColor: Palette.facebookColor,
                      ),
                      CustomTextButton(
                          icon: Icons.g_mobiledata,
                          title: "Google",
                          backgroundColor: Palette.googleColor),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
