import 'package:ecommerce_app2/controller/items/itemsdetails_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/cart/cart_data.dart';
import 'package:ecommerce_app2/data/model/cartmodel.dart';
import 'package:ecommerce_app2/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  TextEditingController? controllerCoupon;
  CouponModel? couponModel;
  String? couponName;
  String? couponID;
  int discountCoupon = 0;
  int priceOrder = 0;
  int totalCountItems = 0;
  // int countItems = 0;
  double? getTotalPriceVariable;
  int? checkItmeCount;
  int? checkCount;

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    cartView();
    super.onInit();
  }

  addCart(String itemsId) async {
    if (checkItmeCount! <= checkCount!) {
      Get.rawSnackbar(
          snackStyle: SnackStyle.GROUNDED,
          progressIndicatorBackgroundColor: AppColor.secondColor,
          title: "alert",
          messageText: const Text(
              "Your order is larger than available in stock",
              style: TextStyle(color: AppColor.backGround)));
    } else {
      statusRequest = StatusRequest.loading;
      update();
      var response = await cartData.addCart(
          myServices.sharedPref.getString("id")!, itemsId.toString());
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.rawSnackbar(
              snackStyle: SnackStyle.GROUNDED,
              progressIndicatorBackgroundColor: AppColor.secondColor,
              title: "Notification",
              messageText: const Text("The Product Was Added To Cart",
                  style: TextStyle(color: AppColor.backGround)));
          //data.addAll(response['items']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }

    update();
  }

  deleteCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPref.getString("id")!, itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            snackStyle: SnackStyle.GROUNDED,
            progressIndicatorBackgroundColor: AppColor.secondColor,
            title: "Notification",
            messageText: const Text("The Product Was Removed From Cart",
                style: TextStyle(color: AppColor.backGround)));
        //data.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  double getTotalPrice() {
    return (priceOrder - priceOrder * discountCoupon / 100);
  }

/*   Future getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCart(
        myServices.sharedPref.getString("id")!, itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        countItems = int.parse(response['data']);
        update();
        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  } */

  cartView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataResponse = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];
          data.clear();
          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
          priceOrder = dataResponseCountPrice['totalprice'];
          totalCountItems = dataResponseCountPrice['totalcount'];
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  couponCheck() async {
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
      } else {
        discountCoupon = 0;
        couponName = null;
        couponID = null;
        Get.snackbar("Warn", "This Coupon Not Valid");
      }
    }
    update();
  }

  goTpPageCheckout(CartModel cartModel) {
    if (data.isEmpty) return Get.snackbar("Message", "Cart is Empty");
    Get.toNamed(AppRotes.checkout, arguments: {
      "couponid": couponID ?? "0",
      "priceorder": priceOrder.toString(),
      "discountcoupon": discountCoupon.toString(),
      "cartModel": cartModel,
      "totalPrice": getTotalPrice()
    });
  }

  resetVariableCart() {
    priceOrder = 0;
    totalCountItems = 0;
    data.clear();
  }

  refrshPage() {
    resetVariableCart();
    cartView();
    update();
  }

  @override
  dispose() {
    controllerCoupon!.dispose();
    super.dispose();
  }

  goToPageItemsDetails() {
    if (!Get.isSnackbarOpen) {
      print("======================== check ${Get.isSnackbarOpen} ");
      Get.back();
      ItemsDetailsControllerImp con = Get.find();
      con.intialData();
    }
    update();
  }
}
