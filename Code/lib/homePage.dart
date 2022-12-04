import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sofe4640_finalproject/controller/cartController.dart';
import 'package:sofe4640_finalproject/loginPage.dart';
import 'package:sofe4640_finalproject/product.dart';
import 'package:sofe4640_finalproject/controller/cartController.dart';
import 'package:carousel_slider/carousel_slider.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}
class _HomePage extends State<homePage> {
  User? user = FirebaseAuth.instance.currentUser;
  var cartController = Get.put(CartController());
  int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Home"),
            ),
            backgroundColor: Colors.grey[100],
          body:
              StreamBuilder<List<Product>>(
                stream: getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasError){
                    return Text("Error ${snapshot.error}");
                  }
                  else if (snapshot.hasData) {
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        CarouselSlider(
                            items: [
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/carousel/banner1.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/carousel/banner2.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/carousel/banner3.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/carousel/banner4.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/carousel/banner5.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                          ],
                          options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 2.0,
                            height: 150,
                            viewportFraction: 1,
                          ),
                        ),
                        const Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child:
                            Align(
                              alignment: Alignment.centerLeft,
                              child:
                                Text("All Products",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              ),
                            ),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: GridView.builder(
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 0,
                                        childAspectRatio: 0.6
                                    ),
                                    itemCount: products.length,
                                    itemBuilder: (context, index) =>
                                        ProductCard(products.elementAt(index))
                                ),
                              ),
                            )
                        )
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }
              ),
          );
      }
    );
  }

  Widget ProductCard(Product product) => Card(
    elevation: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: (){
                    cartController.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("You have added "+ product.name.toString()+ " to the cart")
                    ));
                  },
                  icon: const Icon(Icons.add_shopping_cart)
              ),
            ],
          ),
          Container(
            child: SizedBox(
              height: 100,
              child: Image.asset("assets/images/products/${product.id}.png")
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0,0),
              child: Column(
                children: [
                  Text(product.brand.toString()),
                  Text(product.name.toString(),
                  textAlign: TextAlign.center),
                  Text("\$${product.price}")
                ],
              ),
            ),
          ),
        ],
      ),
  );

  Stream<List<Product>> getProducts() => FirebaseFirestore.instance
      .collection("products")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Product.fromJSON(doc.data())).toList());


}








