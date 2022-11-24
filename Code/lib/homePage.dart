import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        backgroundColor: Colors.grey[100],
        body: Padding (
          padding: const EdgeInsets.all(30.0),
            child: Center(
              child: ListView(
                children:  [
                  ElevatedButton(
                      onPressed: () {
                        signOut();
                      },
                      child: const Text("Logout"))
                ]
              )
            )
          )
        );

  }
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginPage()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully Logged Out!"),
      ));

    }
  }
}