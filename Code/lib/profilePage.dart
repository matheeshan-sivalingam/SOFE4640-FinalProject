import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();

}

class _ProfilePage extends State<profilePage> {
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
                      //Current user's email and signout button implemented for testing purposes
                      Text(user!.email!),
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