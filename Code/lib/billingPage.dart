import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:sofe4640_finalproject/paymentPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:get/get.dart';

class billingPage extends StatefulWidget {
  const billingPage({super.key});
  @override
  State<StatefulWidget> createState() => _BillingPage();
}

class _BillingPage extends State<billingPage> {
  TextEditingController bFname = TextEditingController();
  TextEditingController bLname = TextEditingController();
  TextEditingController bAddress = TextEditingController();
  TextEditingController bCity = TextEditingController();
  TextEditingController bProv = TextEditingController();
  TextEditingController bPost = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    bFname.dispose();
    bLname.dispose();
    bAddress.dispose();
    bCity.dispose();
    bProv.dispose();
    bPost.dispose();

    super.dispose();
  }
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Checkout - Billing"),
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
                    "Please enter your billing address information",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  BreadCrumb(
                    items: <BreadCrumbItem>[
                      BreadCrumbItem(content: Text(''
                          'Shipping',
                          style: GoogleFonts.montserrat(),
                      )),
                      BreadCrumbItem(content: Text('Billing',
                          style: GoogleFonts.montserrat(color: Colors.redAccent))),
                      BreadCrumbItem(content: Text(''
                          'Payment',
                        style: GoogleFonts.montserrat(),
                      )),
                    ],
                    divider: const Icon(Icons.chevron_right),
                  ),
                  const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child:
                      CheckboxListTile(
                            title: Text('Same as shipping', style: GoogleFonts.montserrat()),
                            value: this.isChecked,
                            onChanged:(bool? value) {
                              setState(() {
                                this.isChecked = value;
                                if (this.isChecked==true){
                                  bFname.text = data["sFname"];
                                  bLname.text = data["sLname"];
                                  bAddress.text = data["sAddress"];
                                  bCity.text = data["sCity"];
                                  bProv.text = data["sProv"];
                                  bPost.text = data["sPost"];
                                }
                                else {
                                    bFname.text = "";
                                    bLname.text = "";
                                    bAddress.text = "";
                                    bCity.text = "";
                                    bProv.text = "";
                                    bPost.text = "";
                                }
                                print("${data["sFname"]}");
                              });
                      },
                      )

                )
                ],
              ),
            ),
            TextField(
              controller: bFname,
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
              controller: bLname,
              decoration: const InputDecoration(
                labelText: "Last name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: bAddress,
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
              controller: bCity,
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
              controller: bProv,
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
              controller: bPost,
              decoration: const InputDecoration(
                labelText: "Postal Code",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),
            const SizedBox(height: 25),
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
                  child: const Text('Continue to Payment'),
                  onPressed: () {
                    Get.to(() => paymentPage(), arguments: {
                      "sFname":data["sFname"],
                      "sLname":data["sLname"],
                      "sAddress":data["sAddress"],
                      "sCity":data["sCity"],
                      "sProv":data["sProv"],
                      "sPost":data["sPost"],
                      "bFname":bFname.text,
                      "bLname":bLname.text,
                      "bAddress":bAddress.text,
                      "bCity":bCity.text,
                      "bProv":bProv.text,
                      "bPost":bPost.text
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