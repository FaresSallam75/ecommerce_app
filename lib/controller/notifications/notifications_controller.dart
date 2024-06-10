import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/notifications/notifications.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  List data = [];
   StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find(); 
  

    @override
  void onInit() {
    super.onInit();
    getNotificationsData();
    myServices.sharedPref.getString("lang") == "ar"
        ?  Jiffy.setLocale("ar")
        :  Jiffy.setLocale("en");
  }



  getNotificationsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData
        .getNotificationsData(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


}
