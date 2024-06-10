import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/orders/archieve_orders.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ArchieveOrdersController extends GetxController {
  ArchieveOrdersData archieveOrdersData = ArchieveOrdersData(Get.find());

  List<OrdersModel> data = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "85".tr;
    } else {
      return "86".tr;
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "82".tr;
    } else {
      return "83".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "145".tr;
    } else if (val == "1") {
      return "146".tr;
    } else if (val == "3") {
      return "147".tr;
    } else if (val == "3") {
      return "148".tr;
    } else {
      return "149".tr;
    }
  }

  getCouponDisount(orderPrice, orderDelivery, totolPrice) {
    if ((orderPrice + orderDelivery) == totolPrice) {
      return "0";
    } else {
      return "10 %";
    }
  }

  getOrdersData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await archieveOrdersData
        .archieveOrdersData(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.clear();
        data.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  ratingOrders(String ordersid, double rating, String comment) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await archieveOrdersData.ratingOrders(
        ordersid, rating.toString(), comment);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrdersData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrderPage() {
    getOrdersData();
    update();
  }

  defineLanguage() async {
    print("======================= start of service ");
    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
    update();
    print("======================= end of service ");
  }

  @override
  void onInit() {
    super.onInit();
    getOrdersData();
    defineLanguage();
  }
}
