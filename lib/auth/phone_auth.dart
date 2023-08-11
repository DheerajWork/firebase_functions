import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {

  TextEditingController phoneController = TextEditingController();

  void phoneAuth() async {

    String phone = "+91${phoneController.text.trim()}";

    // await FirebaseAuth.instance.verifyPhoneNumber(
    //   phoneNumber: phone,
    //     verificationCompleted: ,
    //     verificationFailed: ,
    //     codeSent: (){},
    //     codeAutoRetrievalTimeout: )
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Phone Number"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: phoneController,
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
        ],
      ),
    );
  }
}
