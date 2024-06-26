import 'package:flutter/material.dart';
import 'package:taskmanagment/core/model/signup.dart';
import 'package:taskmanagment/core/service/auth_service.dart';
import 'package:taskmanagment/core/view/auth/login_view.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _signUpUser() async {
    if (_formKey.currentState!.validate()) {
      SignupModel signupModel = SignupModel(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      try {
        await _authService.signUpService(signupModel);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Signup Successful'),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Signup Failed$e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Create your account",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: [
                    CustomTextFormField(
                      controller: _firstNameController,
                      keyboardType: TextInputType.name,
                      hintText: "First Name",
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _lastNameController,
                      keyboardType: TextInputType.name,
                      hintText: "Last Name",
                      prefixIcon: const Icon(Icons.person),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.email),
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.blue.shade200,
                      ),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
                const Center(
                  child: Text("Or"),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/login_signup/google.png',
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 18),
                        const Text(
                          "Sign In with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Already have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
