import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id , String userId) async {
    var response = await crud.postData(AppLink.items, {
      "id": id.toString(),
      "usersid": userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
