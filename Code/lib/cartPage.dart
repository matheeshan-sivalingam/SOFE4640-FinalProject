import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/controller/cartController.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:get/get.dart';
import 'package:sofe4640_finalproject/product.dart';

class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<StatefulWidget> createState() => _CartPage();

}

class _CartPage extends State<cartPage> {
  User? user = FirebaseAuth.instance.currentUser;
  CartController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
      Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
          ),
          backgroundColor: Colors.grey[100],
          body:
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Shopping Cart",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  if (controller.cart.length > 0) ...[
                    Container(
                      child: Expanded(
                        child: Padding (
                          padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: Center(
                              child: ListView.builder(
                                  itemCount: controller.cart.length+1,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index==controller.cart.length)
                                      {
                                        return CartTotal();
                                      }
                                    else {
                                      return CartProductCard(
                                        controller: controller,
                                        product: controller.cart.keys.toList()[index],
                                        quantity: controller.cart.values.toList()[index],
                                        index: index,
                                      );
                                    }

                                  }
                              )
                          ),
                        ),
                      ),
                    ),
                  ] else ... [
                    Text("Empty")
                ],
                ],


              ),
          ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  CartController controller;
  Product product;
  int quantity;
  int index;

  CartProductCard({
    super.key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index});




  @override
  Widget build(BuildContext context) {
    int productPrice = quantity * product.price!;
    CartController controller = Get.find();
      return Column(
        children: [
          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 1),
                              )
                            ]
                          ),
                          child: Row(
                            children:[
                              SizedBox(
                                  height: 125,
                                  child: Image.asset("assets/images/${product.id}.png")
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.brand!),
                                  Text(product.name!),
                                  Row(
                                    children: [
                                      const Text("Qty: "),
                                      IconButton(
                                          onPressed: () {
                                            controller.removeProduct(product);
                                          },
                                          icon: const Icon(Icons.remove_circle)
                                      ),
                                      Text('$quantity'),
                                      IconButton(
                                          onPressed: () {
                                            controller.addToCart(product);
                                          },
                                          icon: const Icon(Icons.add_circle)
                                      ),
                                    ],
                                  ),
                                  Text('\$'+'$productPrice')
                                ],
                              ),
                            ]
                          ),
                        ),
                    ],
                ),
          ),
        ],
      );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({super.key});
  CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(40),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${controller.cartSubtotal}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],

                    ),
                ),
              )
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(200, 50),
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)
              ),
            ),
            child: const Text('Proceed to checkout'),
            onPressed: () {
            },
          )
        )
      ],
    );
  }

}


