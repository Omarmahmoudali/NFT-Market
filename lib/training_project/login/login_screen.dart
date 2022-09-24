import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/training_project/layout/app_layout.dart';
import 'package:testapp/training_project/register/register_screen.dart';
import 'package:testapp/widgets/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOGIN',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          emailController.text;
                        });
                      }
                    },
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email address';
                      }
                    },
                    labelText: 'Email Address',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is too short';
                      }
                    },
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          passwordController.text;
                        });
                      }
                    },
                    suffixIcon: isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    isPassword: isPassword,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                      onPressed: () {
                        _logIn();
                      },
                      text: 'LOGIN'),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\`t have an account?'),
                      defaultTextButton(
                        onPressed: () {
                          navigateTo(context, RegisterScreen());
                        },
                        text: 'Register',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      navigateTo(context, const AppLayout());
    } on FirebaseAuthException catch (e) {
      var message = '';

      switch (e.code) {
        case 'invalid-email':
          message = 'this email you entered is invalid';
          break;
        case 'user-disabled':
          message = 'the user you tried to log into is disabled';
          break;
        case 'user-not-found':
          message = 'the user you tried to log into was not found';
          break;
        case 'wrong-password':
          message = 'incorrect password';
          break;
      }

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('log in failed'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('ok'))
              ],
            );
          });
    }
  }
}
