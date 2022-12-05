import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/homePage.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:get/get.dart';
import 'package:sofe4640_finalproject/mainPage.dart';

import 'controller/cartController.dart';

class confirmationPage extends StatefulWidget {
  const confirmationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmationPage();

}

class _ConfirmationPage extends State<confirmationPage> {
  User? user = FirebaseAuth.instance.currentUser;
  String userFname = "";
  CartController controller = Get.find();
  var data = Get.arguments;
  _ConfirmationPage(){
    getName().then((value) => setState((){
      userFname = value;
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Confirmation Page"),
          automaticallyImplyLeading: false,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
                children: [
                  Container(
                      height: 150,
                      child: Image.asset('assets/images/etc/checkMark.png')
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                      child: Text(
                        "Order Confirmation",
                        style: GoogleFonts.bebasNeue(fontSize: 60, height: 0.9),
                        textAlign: TextAlign.center,
                        ),
                      ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Order ID - ${data["orderID"]}",
                      style: GoogleFonts.bebasNeue(fontSize: 30, height: 0.9),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                    Text("Thank you, ${userFname}! You're order has been placed!",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                        ),
                      ),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child:  Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: const Size(200, 50),
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                              ),
                            ),
                            child: const Text('Continue Shopping'),
                            onPressed: () {
                              controller.clearCart();
                              Navigator.pushReplacement(
                                context,
                                  MaterialPageRoute(builder: (context) => const mainPage()),
                              );
                            },
                          )
                      ),
                  )

                ],
              ),
    ]
    )
    );

  }
  Future<String> getName() async{
    DocumentSnapshot userInfo = await FirebaseFirestore.instance.collection("users").doc(user?.uid).get();
    var name = await userInfo["fname"];
    return (name);
  }

}