import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class ArchieveOrdersData {
  Crud crud;
  ArchieveOrdersData(this.crud);
  archieveOrdersData(String usersid) async {
    var response = await crud.postData(AppLink.archieveOrders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

  ratingOrders(String ordersid, String rating, String comment) async {
    var response = await crud.postData(AppLink.rating,
        {"id": ordersid, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }
}
