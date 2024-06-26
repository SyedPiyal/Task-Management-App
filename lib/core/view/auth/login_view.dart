import 'package:flutter/material.dart';
import 'package:taskmanagment/core/view/auth/signup_view.dart';
import 'package:taskmanagment/utils/extensions/context_ext.dart';
import '../../common/custom_textFormField.dart';
import '../../model/login.dart';
import '../../service/auth_service.dart';
import '../home/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthService _authService = AuthService();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      Login loginData = Login(
          email: _emailController.text, password: _passwordController.text);
      try {
        await _authService.loginService(loginData);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login Successful'),
          ),
        );

        // navigate to home screen if successfull ----------------------

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Failed $e'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.only(top: 65),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 15, left: 35),
                  child: Text("Enter your credential to login"),
                ),
                CustomTextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.name,
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  hintText: "Password",
                  prefixIcon: const Icon(Icons.password),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue.shade100,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
