import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/cart/cart_data.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class ItemsDetailsController extends GetxController {
  // intialData();
  increment();
  decrement();
  goToCardPage();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {
  late StatusRequest statusRequest;
  List subItems = [
    {"name": "Red", "id": 1, "active": "0"},
    {"name": "Black", "id": 2, "active": "1"},
    {"name": "Red", "id": 3, "active": "0"}
  ];

  ItemsModel? itemsModel;
  int countItems = 0;
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  ScrollController scrollController = ScrollController();
  Widget? body;
  RefreshController refreshController = RefreshController();
  bool isVisible = false;

  @override
  void onInit() {
    intialData();
    // refreshCount();
    //isVisible = false;
    super.onInit();
  }

  scrollFunction(val) {
    if (val.direction == ScrollDirection.forward) {
      if (!isVisible) {
        isVisible = true;
        update();
      }
    } else if (val.direction == ScrollDirection.reverse) {
      if (isVisible) {
        isVisible = false;
        update();
      }
    }
    update();
  }

  addCart(String itemsId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.addCart(myServices.sharedPref.getString("id")!, itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            snackStyle: SnackStyle.GROUNDED,
            progressIndicatorBackgroundColor: AppColor.secondColor,
            title: "95".tr,
            //Text("تم اضافة المنتج الى السلة ")
            messageText: Text("96".tr,
                style: const TextStyle(color: AppColor.backGround)));
        //data.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCart(String itemsId) async {
    //data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPref.getString("id")!, itemsId);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            snackStyle: SnackStyle.GROUNDED,
            progressIndicatorBackgroundColor: AppColor.secondColor,
            title: "95".tr,
            //Text("تم ازالة المنتج من السلة ")
            messageText: Text("97".tr,
                style: const TextStyle(color: AppColor.backGround)));
        //data.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Future getCountItems(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.getCountCart(
        myServices.sharedPref.getString("id")!, itemsId.toString());
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        countItems = response['data'];

        return countItems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  intialData() async {
    myServices.sharedPref.setString("rote", "2");
    itemsModel = Get.arguments["itemsmodel"];
    countItems = await getCountItems((itemsModel!.itemsId!));
    //countItems = 0;
    update();
  }

  refreshCount() {
    getCountItems((itemsModel!.itemsId!));
    update();
  }

  @override
  increment() {
    if (itemsModel!.itemsCount! == "0") {
      Get.rawSnackbar(
          snackStyle: SnackStyle.GROUNDED,
          progressIndicatorBackgroundColor: AppColor.secondColor,
          title: "98".tr,
          messageText: Text("99".tr,
              style: const TextStyle(color: AppColor.backGround)));
    } else if (int.parse(itemsModel!.itemsCount!) <= countItems) {
      Get.rawSnackbar(
          snackStyle: SnackStyle.GROUNDED,
          progressIndicatorBackgroundColor: AppColor.secondColor,
          title: "98".tr,
          messageText: Text("100".tr,
              style: const TextStyle(color: AppColor.backGround)));
    } else {
      addCart((itemsModel!.itemsId!));
      countItems++;
    }
    update();
  }

  @override
  decrement() {
    if (countItems > 0) {
      deleteCart((itemsModel!.itemsId!));
      countItems--;
      update();
    }
  }

  @override
  goToCardPage() {
    /* if (itemsModel!.itemsCount == "0") {
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          title: "alert",
          messageText: const Text("this Item not availlable in Stock Now"));
    } else if (int.parse(itemsModel!.itemsId!) >= countItems) {
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          title: "alert",
          messageText:
              const Text("Your Order Greater than availlable in Stock"));
    } else {
    } */
    Get.toNamed(AppRotes.cart);
    update();
  }

  void onRefresh() async {
    statusRequest = StatusRequest.loading;
    update();
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshCount();
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
