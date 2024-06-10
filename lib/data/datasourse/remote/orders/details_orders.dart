
import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class DetailsOrdersData {
  Crud crud;
  DetailsOrdersData(this.crud);
  detailsOrdersData(String id) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "id" : id
    });
    return response.fold((l) => l, (r) => r);
  }
}
