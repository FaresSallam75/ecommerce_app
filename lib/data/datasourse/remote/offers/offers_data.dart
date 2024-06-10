import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class OffersData {
  Crud crud;
  OffersData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.offers, {"userid" : userid});
    return response.fold((l) => l, (r) => r);
  }

}
