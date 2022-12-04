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

  void clearCart(){
    if (_cart.isEmpty){
      //Do nothing
    }
    else{
      _cart.clear();
    }
  }

  get cart => _cart;

  get cartSubtotal => _cart.entries
      .map((product) => product.key.price * product.value)
      .toList().reduce((value, element) => value+element).toStringAsFixed(2);

  get cartTax => _cart.entries
      .map((product) => ((product.key.price * product.value)+5)*0.13)
      .toList().reduce((value, element) => value+element).toStringAsFixed(2);

  get cartTotal => _cart.entries
      .map((product) => ((product.key.price * product.value)+5)*1.13)
      .toList().reduce((value, element) => value+element).toStringAsFixed(2);
}