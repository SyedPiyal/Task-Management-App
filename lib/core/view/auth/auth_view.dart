import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/auth/widgets/custom_textbutton.dart';
import 'package:taskmanagment/core/view/auth/widgets/login.dart';
import 'package:taskmanagment/core/view/auth/widgets/middle_container.dart';
import 'package:taskmanagment/core/view/auth/widgets/signup.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';
import '../../../utils/colors/palette.dart';
import '../home/home_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isSignupScreen = false;
  bool isMale = true;
  bool isRememberMe = false;

  void _handleArrowForwardPress() {
    if (isSignupScreen) {
      // Navigate to login screen
      setState(() {
        isSignupScreen = false;
      });
    } else {
      // Navigate to HomeView screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: Stack(
        children: [
          //--------------> top container for welcome text <--------------//

          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 70, left: 20, bottom: 20),
              color: theme.colorScheme.primary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        text: "Welcome ",
                        style: theme.textTheme.headlineLarge?.copyWith(
                            color: theme.colorScheme.onInverseSurface),
                        children: [
                          TextSpan(
                            text: isSignupScreen ? "to Task Manager" : " Back,",
                            style: theme.textTheme.headlineLarge?.copyWith(
                                color: theme.colorScheme.onInverseSurface),
                          )
                        ]),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    isSignupScreen ? "Signup to Continue" : "Login to Continue",
                    style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onPrimary),
                  )
                ],
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          MiddleContainer(
            showShadow: true,
            isSignupScreen: isSignupScreen,
            onSubmit: _handleArrowForwardPress,
          ),
          //Main Container for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 270,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 260,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
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
                                "Login",
                                style: theme.textTheme.bodyLarge?.copyWith(color:!isSignupScreen
                                ? theme.colorScheme.onSurface
                                    : theme.colorScheme.surfaceVariant)/*TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1)*/,
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: theme.colorScheme.onInverseSurface,
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
                                "Sign up",
                                style: theme.textTheme.bodyLarge?.copyWith(color:!isSignupScreen
                                    ? theme.colorScheme.surfaceVariant
                                    : theme.colorScheme.onSurface),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: theme.colorScheme.onInverseSurface,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (!isSignupScreen)
                      LoginContainer(
                        isRememberMe: isRememberMe,
                        onChanged: () {
                          setState(() {
                            isRememberMe = !isRememberMe;
                          });
                        },
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
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          MiddleContainer(
            showShadow: false,
            isSignupScreen: isSignupScreen,
            onSubmit: _handleArrowForwardPress,
          ),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 100,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(isSignupScreen ? "Or Signup with" : "Or Login with",style: theme.textTheme.bodyMedium,),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 20, top: 15),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        icon: Icons.facebook,
                        title: "Facebook",
                        backgroundColor: theme.colorScheme.primary.withOpacity(.8),
                      ),
                      CustomTextButton(
                          icon: Icons.g_mobiledata,
                          title: "Google",
                          backgroundColor: theme.colorScheme.error),
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
