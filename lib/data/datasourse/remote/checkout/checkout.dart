
import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    return response.fold((l) => l, (r) => r);
  } 

  addData(Map data) async {
    var response = await crud.postData(AppLink.paypalData, data);
    return response.fold((l) => l, (r) => r);
  }
}
