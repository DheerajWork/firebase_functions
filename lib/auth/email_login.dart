import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_functions/auth/email_signup.dart';
import 'package:firebase_functions/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({super.key});

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email=="" || password==""){
      log("Enter email or password");
    } else{
      try{
        UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if(credential.user !=null){
          // ignore: use_build_context_synchronously
          Navigator.popUntil(context, (route) => route.isFirst);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const HomeScreen()));
        }
      } on FirebaseAuthException catch (e){
        log(e.code.toString());
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Email Auth"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
                labelText: "Email"
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: "Password",
                  labelText: "Password"
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(child: const Text("SignUp"),
              onPressed: () {login();},),
            GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>const EmailSignup()));
                },
                child: const Text("Create An Account")),
          ],
        ),
      ),
    );
  }
}
