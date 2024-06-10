import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class PendingOrdersData {
  Crud crud;
  PendingOrdersData(this.crud);
  getOrdersData(String usersid) async {
    var response = await crud.postData(AppLink.pendingOrders, {"id": usersid});
    return response.fold((l) => l, (r) => r);
  }

   deleteOrder(String ordersId) async {
    var response = await crud.postData(AppLink.ordersDelete, {"id": ordersId});
    return response.fold((l) => l, (r) => r);
  }
}
