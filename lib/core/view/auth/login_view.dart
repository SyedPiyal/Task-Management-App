import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagment/core/view/auth/signup_view.dart';
import '../../common/custom_snackbar.dart';
import '../../common/custom_textFormField.dart';
import '../../common/function.dart';
import '../../common/snackbar_content_type.dart';
import '../../model/login.dart';
import '../../provider/auth_provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      Login loginData = Login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Provider.of<AuthProvider>(context, listen: false).login(loginData);

      bool isSuccess = await context.read<AuthProvider>().login(loginData);

      if (isSuccess) {
        // Show success CustomSnackbar
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: CustomSnackbar(
              title: 'Login Successful',
              message: 'You have successfully logged in.',
              contentType: SnackBarContentType.success,
            ),
          ),
        );
      } else {
        final authProvider = context.read<AuthProvider>();
        // Show error CustomSnackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomSnackbar(
              title: 'Login Failed',
              message: 'Failed to login: ${authProvider.errorMessage}',
              contentType: SnackBarContentType.failure,

            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: authProvider.isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue.shade100,
                  ),
                  child: authProvider.isLoading
                      ? const CircularProgressIndicator()
                      : const Text(
                          "Login",
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                /*if (authProvider.errorMessage != null)
                  Text(
                    authProvider.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),*/
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
                            builder: (context) => const SignupPage(),
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
