import 'package:flutter/material.dart';


import '../common/widgets/background_image.dart';
import '../common/widgets/bottom_text.dart';
import '../common/widgets/reuseable_elevated_button.dart';
import '../common/widgets/text_feild_style.dart';
import '../common/widgets/text_style.dart';
import '../login/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: BackgroundImage(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Join With Us",
                  style: titleTextStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Email Address";
                    }
                    return null;
                  },
                  decoration: textFeildStyle("Email:"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: firstNameController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter First Name";
                    }
                    return null;
                  },
                  decoration: textFeildStyle("First Name:"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: lastNameController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Last Name";
                    }
                    return null;
                  },
                  decoration: textFeildStyle("Last Name:"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: mobileController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Mobile";
                    }
                    return null;
                  },
                  decoration: textFeildStyle("Mobile:"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: textFeildStyle("Password:"),
                ),
                const SizedBox(
                  height: 15,
                ),
                ReuseableElevatedButton(onTap: () async {
/*
                  if (_form.currentState!.validate()) {

                    final result= await networkRequester().postRequester(
                        "https://task.teamrabbil.com/api/v1/registration", {
                      "email": emailController.text,
                      "firstName": firstNameController.text,
                      "lastName": lastNameController.text,
                      "mobile": mobileController.text,
                      "password": passwordController.text,
                      "photo":""


                    });
                    if(result['status'] == 'success'){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("abc")));
                      emailController.text="";
                      firstNameController.text="";
                      lastNameController.text="";
                      mobileController.text="";
                      passwordController.text="";
                    }

                    print(result);

                  }*/
                }),
                const SizedBox(
                  height: 20,
                ),
                BottomText(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (contex) => const LoginScreen()),
                          (route) => false);
                    },
                    buttonText: "Sign in",
                    firstText: "Have account?")
              ],
            ),
          ),
        ),
      )),
    );
  }
}
