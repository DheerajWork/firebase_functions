import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_functions/auth/email_login.dart';
import 'package:firebase_functions/auth/email_signup.dart';
import 'package:firebase_functions/auth/phone_auth.dart';
import 'package:firebase_functions/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: /*(FirebaseAuth.instance.currentUser !=null) ?const HomeScreen():*/const PhoneAuth(),
    );
  }
}