import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/training_project/login/login_screen.dart';
import 'package:testapp/widgets/components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  String email = "";
  bool isLoading = true;
  Future<void> getData() async {
    log(FirebaseAuth.instance.currentUser!.uid.toString());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      setState(() {
        email = value['email'];
      });
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get()
        .then((value) {
      log(value.id.toString());
      setState(() {
        name = value['name'];
      });
    });
  }

  @override
  void initState() {
    setState(() {});
    getData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Text(
                'Name : $name',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Email : $email',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          // defaultFormField(
          //   controller: emailController,
          //   type: TextInputType.text,
          //   validator: (value) {
          //     if (value!.isEmpty) {
          //       return 'Email Must Not Be empty';
          //     }
          //     return null;
          //   },
          //   labelText: 'Email',
          //   prefixIcon: Icons.email,
          // ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(
            height: 20.0,
          ),
          defaultButton(
            onPressed: () {
              signOut(context);
            },
            text: 'LOG OUT',
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  void signOut(context) {
    navigateAndFinish(context, const LoginScreen());
  }
}
