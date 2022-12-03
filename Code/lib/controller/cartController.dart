import 'package:get/get.dart';
import 'package:sofe4640_finalproject/product.dart';

class CartController extends GetxController {
  var _cart = {}.obs;

  void addToCart(Product product) {
    if(_cart.containsKey(product)){
      _cart[product] +=1;
    }
    else {
      _cart[product]= 1;
    }
  }

  int getNumOfProducts() {
   return _cart.length;
  }

  void removeProduct(Product product){
    if (_cart.containsKey(product) && (_cart[product]) == 1){
      _cart.removeWhere((key, value) => key == product);
    }
    else {
      _cart[product]--;
    }
  }

  get cart => _cart;

  get cartSubtotal => _cart.entries
      .map((product) => product.key.price * product.value)
      .toList().reduce((value, element) => value+element).toStringAsFixed(2);
}