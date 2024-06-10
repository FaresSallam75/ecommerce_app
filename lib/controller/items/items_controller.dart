// ignore_for_file: annotate_overrides
import 'package:ecommerce_app2/controller/homepage/search_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/items/itemsdata.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

abstract class ItemsController extends GetxController {
  intialData();
  changeCat(int val, String catVal);
  getItems(String categoryId);
  goToPageProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends SearchMixController {
  
  List categories = [];
  int? selectedCat;
  String? catId;
  StatusRequest statusRequest = StatusRequest.none;
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  List<ItemsModel> data = [];
  String deliveryTime = "";

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    //Get.delete<ItemsControllerImp>();
    super.dispose();
  }

  intialData() async {
    deliveryTime = myServices.sharedPref.getString("deliverytime")!;
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catId = Get.arguments['catid'];
    getItems(catId!);

    myServices.sharedPref.getString("lang") == "ar"
        ? await Jiffy.setLocale("ar")
        : await Jiffy.setLocale("en");
  }

  changeCat(val, catVal) {
    selectedCat = val;
    catId = catVal;
    getItems(catId!);
    update();
  }

  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['items'];
        data.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshPage() {
    getItems(catId!);
    update(); 
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRotes.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
