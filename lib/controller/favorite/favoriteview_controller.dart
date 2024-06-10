// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ecommerce_app2/controller/homepage/search_controller.dart';
import 'package:ecommerce_app2/controller/items/items_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/favorite/favoriteview_data.dart';
import 'package:ecommerce_app2/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteViewControllerImp extends SearchMixController {
  List<MyFavoriteModel> data = [];
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteViewData favoriteData = FavoriteViewData(Get.find());

  @override
  void onInit() {
    getFavoriteData();
    search = TextEditingController();
    super.onInit();
  }

  getFavoriteData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await favoriteData.addFavorite(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("Data Data ============================================");
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deletefavoriteData(String favorId) {
    // ignore: unused_local_variable
    var response = favoriteData.deleteFavorite(favorId);
    data.removeWhere((element) => element.favoriteId == favorId);
    update();
  }

  getBack() {
    if (Get.previousRoute == "/homepage") {
      /*  Get.back();
      HomePageControllerImp con = Get.find();
      con.refreshPage(); */
      // Get.offAllNamed(AppRotes.homePage);
      Get.back();
    }
    if (Get.previousRoute == "/itemshomepage") {
      Get.back();
      ItemsControllerImp con = Get.find();
      con.getItems(con.catId!);
    }
    /* else if (Get.previousRoute == "/offersView") {
      Get.back();
      OffersController con = Get.find();
      con.refreshPage();
    } */
  }
}
