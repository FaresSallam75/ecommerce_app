import 'dart:async';

import 'package:ecommerce_app2/controller/homepage/search_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/offers/offers_data.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());
  List<ItemsModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  Widget? body;
  RefreshController refreshController = RefreshController();
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();

    /*   Timer.periodic(const Duration(seconds: 2), (timer) {
      getOffersData();
    });
 */
    getOffersData();
    // Get.delete<OffersController>();
    //Get.put(OffersController());
    // Get.find<OffersController>().onInit();
    super.onInit();
  }

  getOffersData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await offersData.getData(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        update();
        List dataResponse = response['data'];
        data.clear();
        data.addAll(dataResponse.map((e) => ItemsModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshPage() {
    getOffersData();
    update();
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed(AppRotes.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }

  void onRefresh() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(milliseconds: 1000));
    getOffersData();
    refreshController.refreshCompleted();
    statusRequest = StatusRequest.success;
    update();
  }

  void onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.loadComplete();
    //refreshCount();
    update();
  }

  Widget custom(Widget widget) {
    return CustomFooter(
      builder: (context, mode) {
        update();
        Widget body;
        if (mode == LoadStatus.idle) {
          body = const Text("pull up load");
          print("one ==================  $body");
        } else if (mode == LoadStatus.loading) {
          body = const CircularProgressIndicator();
          print("two ==================  $body");
        } else if (mode == LoadStatus.failed) {
          body = const Text("Load Failed!Click retry!");
          print("three ==================  $body");
        } else if (mode == LoadStatus.canLoading) {
          body = const Text("release to load more");
          print("four ==================  $body");
        } else {
          body = const Text("No more Data");
          print("five ==================  $body");
        }
        print("final 1 ==========================  $body");
        print("final 2 ==========================  $widget");
        update();
        return body;
      },
    );
  }
}
