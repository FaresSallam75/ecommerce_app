import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:ecommerce_app2/linkapi.dart';

class NotificationsData {
  Crud crud;
  NotificationsData(this.crud);
  getNotificationsData(String id) async {
    var response = await crud.postData(AppLink.notificationsData, {
      "id" : id
    });
    return response.fold((l) => l, (r) => r);
  }
}
