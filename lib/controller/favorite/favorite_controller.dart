import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/favorite/favorites_data.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  List data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData favoriteData = FavoriteData(Get.find());

  setFavorite(String id, String val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPref.getString("id")!, itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            snackStyle: SnackStyle.GROUNDED,
            progressIndicatorBackgroundColor: AppColor.secondColor,
            title: "Notification", // تم اضافة المنتج الى المفضلة
            messageText: const Text(
              "This Item was Added to Favorite",
              style: TextStyle(color: AppColor.backGround),
            ));
        //data.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  removeFavorite(String itemsId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPref.getString("id")!, itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "Notification", //تم حذف المنتج من المفضلة
            messageText: const Text("This Item was Removed From Favorite",
                style: TextStyle(color: AppColor.backGround)));
        //data.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
