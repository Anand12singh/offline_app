// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/features/auth/pages/signup_page.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => LoginPage(),
      );
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  void signInpUser() {
    if (formKey.currentState!.validate()) {
      //store value
      print('validate');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: 'Email',
                  ),
                  validator: (v) {
                    if (v!.trim().isEmpty || !v.trim().contains('@gmail.com')) {
                      return 'Enter valid Email';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: (v) {
                  if (v!.trim().isEmpty) {
                    return 'Password fild cannot be empty!';
                  }
                  return null;
                },
              ),
              Gap(30),
              ElevatedButton(
                  onPressed: () {
                    signInpUser();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              Gap(30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(SignupPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Dont\t have Account ? ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: const [
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
