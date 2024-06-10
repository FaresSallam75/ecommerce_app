import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/cart/cart_data.dart';
import 'package:ecommerce_app2/data/model/couponmodel.dart';
import 'package:get/get.dart';

class CouponsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

/*   CouponModel? couponModel;
  String? couponName;
  String? couponID;
  int? discountCoupon;
  int? couponCount; */
  List<CouponModel> listcouponData = [];

/*   int priceOrder = 0;
  int totalCountItems = 0;
  int countItems = 0; */

  @override
  void onInit() {
    super.onInit();
    couponView();
  }

  couponView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCoupon();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response['data'];
        listcouponData.addAll(responsedata.map((e) => CouponModel.fromJson(e)));
        // couponModel = CouponModel.fromJson(responsedata);
        /*   discountCoupon = int.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponID = couponModel!.couponId;
        couponCount = int.parse(couponModel!.couponCount!);
         */
      } else {
        statusRequest = StatusRequest.failure;
        /* discountCoupon = 0;
        couponName = null;
        couponID = null;
        Get.snackbar("Warn", "This Coupon Not Valid"); */
      }
    }
    update();
  }
}
