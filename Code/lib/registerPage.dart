import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sofe4640_finalproject/loginPage.dart';




class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPage();

}

class _RegisterPage extends State<registerPage> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fname.dispose();
    lname.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text("Register"),
        ),

        body: Padding (
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ListView(
              children:  [
                Text(
                  "Create account",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 60,
                      height: 0.9
                  ),
                  textAlign: TextAlign.center,
                  ),
                Text(
                    "Enter your Name, Email, Phone Number, and Password to Sign up",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                //First textbox
                TextField(
                  controller: fname,
                  decoration: const InputDecoration(
                    labelText: "First Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),

                const SizedBox(height: 20),

                //Last Name textbox
                TextField(
                  controller: lname,
                  decoration: const InputDecoration(
                    labelText: "Last Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),

                const SizedBox(height: 20),

                //Email textbox
                TextField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),

                const SizedBox(height: 20),

                //Phone number textbox
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                    labelText: "Phone number",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),

                const SizedBox(height: 20),

                //Password textbox
                TextField(
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.redAccent),
                    ),
                    filled: true,
                    fillColor: Colors.white60,
                  ),
                ),

                const SizedBox(height: 40),

                // Create an account button
                Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(200, 50),
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                      ),
                      child: const Text('Create an account'),
                      onPressed: () {
                        register();
                      },
                    )
                ),
              ],
            ),
          )
      ),
    );

  }
  Future register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      User? user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection("users").doc(user?.uid).set({
        'uid' : user?.uid,
        'fname' : fname.text,
        'lname' : lname.text,
        'email' : email.text,
        'phone' : phone.text,
      });

      if (mounted) {
        Navigator.pop(context, MaterialPageRoute(builder: (context) => const loginPage()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Account successfully created!")));
      }
    }
    catch (e){

    }


  }

}