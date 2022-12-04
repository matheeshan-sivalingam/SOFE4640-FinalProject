import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/confirmationPage.dart';
import 'package:sofe4640_finalproject/controller/cartController.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:sofe4640_finalproject/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:sofe4640_finalproject/billingPage.dart';
import 'package:get/get.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class paymentPage extends StatefulWidget {
  const paymentPage({super.key});

  @override
  State<StatefulWidget> createState() => _PaymentPage();
}

class _PaymentPage extends State<paymentPage> {
  TextEditingController pName = TextEditingController();
  TextEditingController pCnum = TextEditingController();
  TextEditingController pExpDate = TextEditingController();
  TextEditingController pCvv = TextEditingController();
  TextEditingController pPost = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    pName.dispose();
    pCnum.dispose();
    pExpDate.dispose();
    pCvv.dispose();
    pPost.dispose();
    super.dispose();
  }
  CartController controller = Get.find();
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Checkout - Payment"),
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
                        "Please enter your payment information",
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
                              style: GoogleFonts.montserrat())),
                          BreadCrumbItem(content: Text(''
                              'Payment',
                            style: GoogleFonts.montserrat(color: Colors.redAccent),
                          )),
                        ],
                        divider: const Icon(Icons.chevron_right),
                      ),
                    ]
                )
            ),
            TextField(
              controller: pName,
              decoration: const InputDecoration(
                labelText: "Card Holder's Name",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: pCnum,
              decoration: const InputDecoration(
                labelText: "Card Number",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                CreditCardNumberInputFormatter()
              ],
            ),

            const SizedBox(height: 10),
            Container(
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 200,
                      child: TextField(
                        controller: pExpDate,
                        decoration: const InputDecoration(
                          labelText: "Expiry Date",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.redAccent),
                          ),
                          filled: true,
                          fillColor: Colors.white60,
                        ),
                        keyboardType: TextInputType.datetime,
                        inputFormatters: [
                          CreditCardExpirationDateFormatter()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 180,
                      child: TextField(
                        controller: pCvv,
                        decoration: const InputDecoration(
                          labelText: "CVV",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.redAccent),
                          ),
                          filled: true,
                          fillColor: Colors.white60,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          CreditCardCvcInputFormatter()
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            const SizedBox(height: 10),

            TextField(
              controller: pPost,
              decoration: const InputDecoration(
                labelText: "Postal code",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: Colors.redAccent),
                ),
                filled: true,
                fillColor: Colors.white60,
              ),

            ),
            CartTotal(),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  minimumSize: const Size(200, 50),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                ),
                child: const Text('Place Order'),
                onPressed: (){
                  placeOrder();
                },
              ),
            ),
          ],

        ),
      ),
    );
  }
  Future placeOrder() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      CollectionReference order = FirebaseFirestore.instance.collection('orders');
      Map<String, dynamic> shipping = {
        "sFname" :data["sFname"],
        "sLname": data["sLname"],
        "sAddress":data["sAddress"],
        "sCity":data["sCity"],
        "sProv":data["sProv"],
        "sPost":data["sPost"],
      };
      Map<String, dynamic> billing = {
        "bFname":data["bFname"],
        "bLname":data["bLname"],
        "bAddress":data["bAddress"],
        "bCity":data["bCity"],
        "bProv":data["bProv"],
        "bPost":data["bPost"]
      };
      Map<String, int> cart = {};
      for (int i = 0; i<controller.cart.length;i++)
        {
          Product prod = controller.cart.keys.toList()[i];
          int quantity = controller.cart.values.toList()[i];
          cart[prod.id!] = quantity;
        }



      DocumentReference _order = await order.add({
        'uid' : user?.uid,
        'total':controller.cartTotal,
        'billing': billing,
        'shipping': shipping,
        'cart': cart
      });
      String orderID = _order.id;
      print(orderID);
      if (mounted) {
        Get.to(() => confirmationPage(), arguments: {
          "orderID":orderID,
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Order has been successfully placed!")));
      }
    } catch (e){
      print(e);
    }


  }
}

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Row(
              children:  [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Subtotal - ",
                    style:GoogleFonts.montserrat(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text("\$${controller.cartSubtotal}",
                  style:GoogleFonts.montserrat(
                    fontSize: 20,
                  ),)
              ],
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Shipping & Handeling - ",
                  style:GoogleFonts.montserrat(
                    fontSize: 20,
                  ),),
              ),
              Text("\$5.00",
                style:GoogleFonts.montserrat(
                  fontSize: 20,
                ),)
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Tax - ",
                  style:GoogleFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ),
              Text("\$${controller.cartTax}",
                style:GoogleFonts.montserrat(
                  fontSize: 20,
                ),)
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children:  [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Order Total - ",
                  style:GoogleFonts.montserrat(
                    fontSize: 20,fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Text("\$${controller.cartTotal}",
                style:GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.bold
                ),)
            ],
          ),
        ],
      ),
    );
  }


}