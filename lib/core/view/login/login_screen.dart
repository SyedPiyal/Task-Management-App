import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagment/core/providers/auth_provider.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';
import '../../../utils/enums/status.dart';
import '../common/widgets/background_image.dart';
import '../common/widgets/bottom_text.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_feild_style.dart';
import '../forgetPassword/forget_password_screen.dart';
import '../main_bottom_nav_bar.dart';
import '../signup/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Stack(children: [
        //background image use in reuseable widget
        BackgroundImage(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text
                    Text(
                      "Get Started With",
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      //text form feild style use reuseable widget
                      decoration: textFeildStyle("Email:"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      //text form feild style use reuseable widget
                      decoration: textFeildStyle("Password:"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 18,
                    ),

                    // show loading ----------------------

                    if (loginProvider.status == Status.Authentication)
                      const CircularProgressIndicator(),
                    if (loginProvider.status != Status.Authentication)
                      ReuseableElevatedButton(
                        onTap: () async {
                          if (_form.currentState?.validate() ?? false) {
                            await loginProvider.login(
                              emailController.text,
                              passwordController.text,
                            );
                            if (loginProvider.status == Status.LoggedIn) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const MainBottomNavBar(),
                                ),
                                (route) => false,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login failed'),
                                ),
                              );
                            }
                          }
                        },
                      ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          //go to forget password screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forget Password ?",
                          style: TextStyle(
                            color: Color.fromRGBO(95, 95, 95, 95),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //bootom part use reuseable widget
                    BottomText(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ),
                            (route) => false);
                      },
                      buttonText: "Signup",
                      firstText: 'Don’t have account?',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
