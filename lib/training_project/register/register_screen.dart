import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/training_project/login/login_screen.dart';
import 'package:testapp/widgets/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  var loading = false;

  bool isPassword = true;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'Let\'s Get Started!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Create an account to E Commerce to get all feature',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      onFieldSubmitted: (value) {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            nameController.text;
                            emailController.text;
                            passwordController.text;
                          });
                        }
                      },
                      controller: nameController,
                      type: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your name';
                        }
                        return null;
                      },
                      labelText: 'NAME',
                      prefixIcon: Icons.person),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          nameController.text;
                          emailController.text;
                          passwordController.text;
                        });
                      }
                    },
                    controller: emailController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your Email';
                      }
                      return null;
                    },
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultFormField(
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          nameController.text;
                          emailController.text;
                          passwordController.text;
                        });
                      }
                    },
                    isPassword: isPassword,
                    suffixIcon: isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    suffixPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    controller: passwordController,
                    type: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your password';
                      }
                      return null;
                    },
                    labelText: 'Password',
                    prefixIcon: Icons.lock,
                  ),
                  // TextFormField(
                  //   obscureText: isPasswordHidden,
                  //   onChanged: (value) {
                  //     password = value;
                  //   },
                  //   validator: (value) {
                  //     if (value!.isEmpty) {
                  //       return "password is required";
                  //     }
                  //   },
                  //   decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(40.0)),
                  //       prefixIcon: const Icon(Icons.lock),
                  //       labelText: "Password",
                  //       suffixIcon: IconButton(
                  //         onPressed: () {
                  //           isPasswordHidden = !isPasswordHidden;
                  //           print(isPasswordHidden);
                  //           setState(() {});
                  //         },
                  //         icon: Icon(
                  //           isPasswordHidden
                  //               ? Icons.visibility
                  //               : Icons.visibility_off,
                  //         ),
                  //       )),
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      onPressed: () {
                        _signUp();
                      },
                      text: 'Create'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text(
                            'Login here',
                          ))
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

  // Future _signUp() async {
  //   showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => const Center(child: CircularProgressIndicator()));
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     print(e);
  //     print(emailController.text);
  //   }
  // }

  // Future<void> showErrorDialog() async {
  //   return showDialog<void>(
  //     context: context,
  //     // barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('Error in login'),
  //         content: const Text(
  //             'There is a error in you data correct your data please '),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('ok'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future _signUp() async {
    setState(() {
      // loading = true;
    });
    try {
      var userResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userResult.user?.uid)
          .set({'email': emailController.text, 'name': nameController.text});
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Sign Up Succeeded'),
                content:
                    const Text('Your Account was Created you can sign in now'),
                actions: [
                  TextButton(
                      onPressed: () {
                        navigateTo(context, const LoginScreen());
                      },
                      child: const Text('ok')),
                ],
              ));
      Navigator.of(context).pop;
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
      setState(() {
        loading = false;
      });
    }
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String messageToDisplay;
    switch (e.code) {
      case 'email-already-in-use':
        messageToDisplay = 'This email is already in use';
        break;
      case 'invalid-email':
        messageToDisplay = 'The email is invalid';
        break;
      case 'operation-not-allowed':
        messageToDisplay = 'This operation is not allowed';
        break;
      default:
        messageToDisplay = 'Ann unknown error occureed';
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Sign Up Falied'),
              content: Text(messageToDisplay),
              actions: [
                TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('ok'))
              ],
            ));
  }
}
