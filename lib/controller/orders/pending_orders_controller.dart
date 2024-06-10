import 'package:ecommerce_app2/controller/cart/cart_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/orders/pending_orders.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class PendingOrdersController extends GetxController {
  PendingOrdersData pendingOrdersData = PendingOrdersData(Get.find());
  List<OrdersModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  final CartController contro = Get.put(CartController());

  /* CartData cartData = CartData(Get.find());
  CouponModel? couponModel;
  String? couponName;
  String? couponID;
  int discountCoupon = 0;
  TextEditingController? controllerCoupon; */

  String printOrderType(String val) {
    if (val == "0") {
      return "85".tr;
    } else {
      return "86".tr; //"Rcieve";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "82".tr;
    } else {
      return "83".tr;
    }
  }

  getCouponDisount(orderPrice, orderDelivery, totolPrice) {
    if ((orderPrice + orderDelivery) == totolPrice) {
      return "0";
    } else {
      return "10 %";
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "145".tr;
    } else if (val == "1") {
      return "146".tr;
    } else if (val == "2") {
      return "147".tr;
    } else if (val == "3") {
      return "148".tr;
    } else {
      return "149".tr; //"Arcieved";
    }
  }

  goToPageTracking(OrdersModel ordersModel) {
    Get.toNamed(AppRotes.ordersTracking,
        arguments: {"ordersmodel": ordersModel});
  }

  /* couponCheck() async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> responsedata = response['data'];
        couponModel = CouponModel.fromJson(responsedata);
        discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponID = couponModel!.couponId;
        print("discountCoupon =================================== $discountCoupon ");
        print("couponName ======================================= $couponName ");
        print("couponID ========================================= $couponID ");
      } else {
        discountCoupon = 0;
        couponName = null;
        couponID = null;
        Get.snackbar("Warn", "This Coupon Not Valid");
      }
    }
    update();
  } */

  getOrdersData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData
        .getOrdersData(myServices.sharedPref.getString("id")!);
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

  deleteOrders(String orderId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pendingOrdersData.deleteOrder(orderId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refreshOrderPage();
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
    //controllerCoupon = TextEditingController();
  }
}
