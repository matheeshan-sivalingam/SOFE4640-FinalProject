import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:get/get.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfilePage();

}

class _ProfilePage extends State<profilePage> {
  User? user = FirebaseAuth.instance.currentUser;

  TextEditingController tName = TextEditingController();
  TextEditingController tPhone = TextEditingController();
  TextEditingController tEmail = TextEditingController();

  _ProfilePage() {
    getFname().then((value) =>
        setState(() {
          tName.text = value;
        }));
    getLname().then((value) =>
        setState(() {
          tName.text += " "+value;
        }));
    getPhone().then((value) =>
        setState(() {
          tPhone.text = value;
        }));
    getEmail().then((value) =>
        setState(() {
          tEmail.text = value;
        }));



    void dispose() {
      // Clean up the controller when the widget is disposed.
      tName.dispose();
      tPhone.dispose();
      tEmail.dispose();
      super.dispose();
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.grey[100],
          body: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Center(
                  child: Column(
                      children: [
                        Center(
                          child: Text("Profile",
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 50,
                                  height: 0.9
                              )
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Image.asset(
                              'assets/images/etc/userIcon.png'
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: tName,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.redAccent),
                            ),
                            filled: true,
                            fillColor: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: tEmail,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.redAccent),
                            ),
                            filled: true,
                            fillColor: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: tPhone,
                          enabled: false,
                          decoration: const InputDecoration(
                            labelText: 'Phone',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.redAccent),
                            ),
                            filled: true,
                            fillColor: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 40),
                        //Current user's email and signout button implemented for testing purposes
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
                              child: const Text('Sign out'),
                              onPressed: () {
                                signOut();
                              },
                            )
                        ),
                      ]
                  )
              )
          )
      );
    }
    Future<String> getFname() async {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance.collection(
          "users").doc(user?.uid).get();
      var fname = await userInfo["fname"];
      return (fname);
    }
    Future<String> getLname() async {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance.collection(
          "users").doc(user?.uid).get();
      var lname = await userInfo["lname"];
      return (lname);
    }
    Future<String> getPhone() async {
      DocumentSnapshot userInfo = await FirebaseFirestore.instance.collection(
          "users").doc(user?.uid).get();
      var phone = await userInfo["phone"];
      return (phone);
    }
  Future<String> getEmail() async {
    DocumentSnapshot userInfo = await FirebaseFirestore.instance.collection(
        "users").doc(user?.uid).get();
    var phone = await userInfo["email"];
    return (phone);
  }

    Future signOut() async {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const loginPage()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Successfully Logged Out!"),
        ));
      }
    }
  }


