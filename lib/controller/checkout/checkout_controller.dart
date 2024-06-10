// ignore_for_file: unnecessary_null_comparison

import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/bottomsheet_payment.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/address/address_data.dart';
import 'package:ecommerce_app2/data/datasourse/remote/cart/cart_data.dart';
import 'package:ecommerce_app2/data/datasourse/remote/checkout/checkout.dart';
import 'package:ecommerce_app2/data/model/addressmodel.dart';
import 'package:ecommerce_app2/data/model/cartmodel.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  CheckoutData checkoutData = CheckoutData(Get.find());
  CartData cartData = CartData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> listData = [];

  String? paymentMethod;
  String? deliveryType;
  String? addressId = "0";

  late String discountCoupon;
  late String couponId;
  late String priceOrder;
  CartModel? cartModel;

  double? getTotalPrice;

  // paypal data
  String? accountId;
  String? name;
  String? email;
  String? method;
  String? status;
  String? amount;
  String? countryCode;
  String? currency;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveyType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressId = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    couponId = Get.arguments['couponid'];
    priceOrder = Get.arguments['priceorder'];
    discountCoupon = Get.arguments['discountcoupon'];
    cartModel = Get.arguments['cartModel'];
    getTotalPrice = Get.arguments['totalPrice'];

    getShippingAddresss();
  }

  getShippingAddresss() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.viewData(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        addressId = listData[0].addressId.toString();
      } else {
        print("addressId =================================== $addressId");
        print("NOT OK ==========================================  ");
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  bottomSheetPaymetMethod() {
    if (paymentMethod == null) {
      return Get.snackbar("88".tr, "89".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("88".tr, "90".tr);
    }

    if (deliveryType == "0") {
      if (listData.isEmpty) {
        return Get.snackbar("88".tr, "91".tr);
      }
    } else {
      addressId;
    }

    showBottomSheetMenu();
  }

  paypalData() async {
    // statusRequest = StatusRequest.loading;
    // update();
    Map mapData = {
      "accountId": accountId,
      "name": name,
      "email": email,
      "method": method,
      "status": status,
      "amount": amount,
      "countryCode": countryCode,
      "currency": currency,
      "usersid": myServices.sharedPref.getString("id")!
    };
    var response = await checkoutData.addData(mapData);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("88".tr, "89".tr);
    }
    if (deliveryType == null) {
      return Get.snackbar("88".tr, "90".tr);
    }

    if (deliveryType == "0") {
      if (listData.isEmpty) {
        return Get.snackbar("88".tr, "91".tr);
      }
    }
    /* else {
      return addressId;
    } */
    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPref.getString("id"),
      "addressid":  deliveryType == "0" ? addressId! : "0",
      "orderstype": deliveryType!,
      "ordersprice": priceOrder,
      "ordersdelivery": deliveryType == "0" ? "10" : "0",
      "couponid": couponId,
      "coupondiscount": discountCoupon,
      "orderspayment": paymentMethod!,
      "countItems": cartModel!.countitems!,
      "itemsId": cartModel!.itemsId!,
    };
    var response = await checkoutData.checkout(data);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (paymentMethod == "1") {
          paypalData();
        } 
          Get.offAllNamed(AppRotes.homePage);
          Get.snackbar("92".tr, "93".tr);
      
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("88".tr, "94".tr);
      }
    }
    update();
  }
}
