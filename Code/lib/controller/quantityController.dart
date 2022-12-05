import 'package:get/get.dart';
import 'package:sofe4640_finalproject/homePage.dart';
import 'package:sofe4640_finalproject/product.dart';
class QuantityController extends GetxController {
  var _quantity = 0.obs;
  var zero = 0;
  initialize(){
    _quantity.value = 1;
  }

  increment(){
    _quantity++;
    update();
  }
  decrement(){
    if (_quantity==1)
      {
        //Do nothing
      }
    else {
      _quantity--;
      update();
    }
  }
  get quantity => _quantity();
}