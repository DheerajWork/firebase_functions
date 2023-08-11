import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_functions/auth/email_login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void logOut()async{
    FirebaseAuth.instance.signOut();

    Navigator.popUntil(context, (route) => route.isFirst);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>const EmailLogin()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            logOut();
          }, icon: const Icon(Icons.exit_to_app))
        ],
        backgroundColor: Colors.orange,
        title: const Text("Home Page"),
      ),
    );
  }
}
