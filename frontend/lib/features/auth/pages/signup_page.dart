// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frontend/features/auth/login_page.dart';
import 'package:gap/gap.dart';

class SignupPage extends StatefulWidget {
  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => SignupPage(),
      );
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  void signUpUser() {
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
                "Sign Up.",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
                validator: (v) {
                  if (v!.trim().isEmpty) {
                    return 'Name fild cannot be empty!';
                  }
                  return null;
                },
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
                    signUpUser();
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  )),
              Gap(30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(LoginPage.route());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have account ? ',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                      children: const [
                        TextSpan(
                            text: 'Sign In',
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
