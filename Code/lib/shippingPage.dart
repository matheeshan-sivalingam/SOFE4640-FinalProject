import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:sofe4640_finalproject/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:sofe4640_finalproject/billingPage.dart';
import 'package:get/get.dart';

class shippingPage extends StatefulWidget {
  const shippingPage({super.key});

  @override
  State<StatefulWidget> createState() => _ShippingPage();
}

class _ShippingPage extends State<shippingPage> {
  TextEditingController sFname = TextEditingController();
  TextEditingController sLname = TextEditingController();
  TextEditingController sAddress = TextEditingController();
  TextEditingController sCity = TextEditingController();
  TextEditingController sProv = TextEditingController();
  TextEditingController sPost = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    sFname.dispose();
    sLname.dispose();
    sAddress.dispose();
    sCity.dispose();
    sProv.dispose();
    sPost.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Checkout - Shipping"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Column(
              children: [
                Center(
                  child: Text("Checkout",
                  style: GoogleFonts.bebasNeue(
                      fontSize: 50,
                      height: 0.9
                      )
                    ),
                ),
                Text(
                  "Please enter your shipping address information",
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                BreadCrumb(
                  items: <BreadCrumbItem>[
                    BreadCrumbItem(content: Text(''
                        'Shipping',
                      style: GoogleFonts.montserrat(color: Colors.redAccent),
                    )),
                    BreadCrumbItem(content: Text('Billing',
                        style: GoogleFonts.montserrat())),
                    BreadCrumbItem(content: Text(''
                        'Payment',
                      style: GoogleFonts.montserrat(),
                    )),
                  ],
                  divider: const Icon(Icons.chevron_right),
                ),
              ]
            )
          ),
          TextField(
              controller: sFname,
              decoration: const InputDecoration(
                labelText: "First name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),
              const SizedBox(height: 10),

            TextField(
              controller: sLname,
              decoration: const InputDecoration(
                labelText: "Last name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),

            const SizedBox(height: 50),

            TextField(
              controller: sAddress,
              decoration: const InputDecoration(
                labelText: "Street Address",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: sCity,
              decoration: const InputDecoration(
                labelText: "City",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: sProv,
              decoration: const InputDecoration(
                labelText: "Province",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),

            const SizedBox(height: 10),
            TextField(
              controller: sPost,
              decoration: const InputDecoration(
                labelText: "Postal Code",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),
            const SizedBox(height: 50),
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
                  child: const Text('Continue to Billing Address'),
                  onPressed: () {
                    Get.to(() => billingPage(), arguments: {
                      "sFname":sFname.text,
                      "sLname":sLname.text,
                      "sAddress":sAddress.text,
                      "sCity":sCity.text,
                      "sProv":sProv.text,
                      "sPost":sPost.text
                    });
                  },
                )
            ),
          ],
        ),
      ),
    );
  }
}