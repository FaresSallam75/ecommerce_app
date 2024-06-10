import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class PaypalData {
  Crud crud;
  PaypalData(this.crud);

  addData(Map data) async {
    var response = await crud.postData(AppLink.items, data);
    return response.fold((l) => l, (r) => r);
  }
}
