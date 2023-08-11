import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_functions/auth/email_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if (email == "" || password == "" || cPassword == "") {
      log("Please fill all the details");
    } else if (password != cPassword) {
      log("Password do not match");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        log("User Created");
        if(userCredential.user != null){
          Navigator.pop(context);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == "email-already-in-use") {
          //snack-bar
        }

        log(e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(hintText: "Email", labelText: "Email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Password", labelText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: cPasswordController,
              decoration: const InputDecoration(
                  hintText: "Confirm Password", labelText: "Confirm Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              child: const Text("SignUp"),
              onPressed: () {
                createAccount();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const EmailLogin()));
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
