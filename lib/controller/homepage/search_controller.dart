import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/data/datasourse/remote/homepage/home_data.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMixController extends GetxController {
  
  late StatusRequest statusRequest;
  HomePageData homePageData = HomePageData(Get.find());
  late TextEditingController search;
  bool isSearch = false;
  List<ItemsModel> listData = [];
  
  getSearchData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.searchData(search.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  checkSearchItems(String val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchIcons() {
    isSearch = true;
    getSearchData();
    update();
  }

  showSnack() {
    if (search.text == "") {
      Get.snackbar(
        "alert",
        "Search Empty",
        backgroundColor: AppColor.black,
        colorText: AppColor.backGround,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
