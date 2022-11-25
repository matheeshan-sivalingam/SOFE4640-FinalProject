import 'package:get/get.dart';
import 'package:sofe4640_finalproject/product.dart';

class CartController extends GetxController {
  var cart = {}.obs;

  void addToCart(Product product) {
    if (cart.containsKey(product.name)) {
      cart[product.name]++;
    } else {
      cart[product.name] = 1;
    }
    
    print(product.name);
    print(getNumOfProducts());
    print(cart);
  }

  int getNumOfProducts() {
   return cart.length;
  }

}