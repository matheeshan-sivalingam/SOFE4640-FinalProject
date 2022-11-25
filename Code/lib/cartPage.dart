import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPage();

}

class _CartPage extends State<cartPage> {
  User? user = FirebaseAuth.instance.currentUser;
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

                    ]
                )
            )
        )
    );
  }
}