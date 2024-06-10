import 'dart:async';
import 'package:ecommerce_app2/controller/homepage/search_controller.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/homepage/home_data.dart';
import 'package:ecommerce_app2/data/datasourse/static/onbordinghomepage.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  goToPageItems(List categories, int selectedCat, String categoryId);
}

class HomePageControllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  String? lang;
  String? user;
  String? id;
  String? categoryId;
  int currentValue = 0;
  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliverTime = "";
  int index = 0;
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  List<ItemsModel> items = [];
  List settingsData = [];

  HomePageData homePageData = HomePageData(Get.find());
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    print(" Get.localec one ============ ${Get.locale}");
    print(" Get.localec two============ ${Get.deviceLocale!.languageCode}");
    print(" Get.localec three ============ ${Get.locale!.languageCode}");
    pageController = PageController();
    search = TextEditingController();
    initState();
    getData();
    initialData();
  }

  @override
  void dispose() {
    search.dispose();
    pageController.dispose();
    super.dispose();
  }

  initState() {
    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (currentValue < onBordingHomePage.length - 1) {
        if (pageController.hasClients) {
          currentValue++;
          pageController.animateToPage(
            currentValue,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeIn,
          );
        }
      } else {
        currentValue = 0;
        if (pageController.hasClients) {
          pageController.animateToPage(
            currentValue,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeIn,
          );
        }
      }
    });
    update();
  }

  initialData() {

    lang = myServices.sharedPref.getString("lang") ?? Get.locale!.languageCode;
    print("lang from homepage =================== $lang ");
    user = myServices.sharedPref.getString("username");
    id = myServices.sharedPref.getString("id");
    categoryId = myServices.sharedPref.getString("catid");
    myServices.sharedPref.setString("rote", "1");
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homePageData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        List listItems = response['items']['data'];
        if (listItems.isNotEmpty) {
          items.addAll(listItems.map((e) => ItemsModel.fromJson(e)));
          print(
              "=============================================== one $listItems");
        }
        print("=============================================== two $listItems");
        settingsData.addAll(response['settings']['data']);
        titleHomeCard =
            translateDatabase("57".tr, settingsData[0]['settings_titlehome']);
        bodyHomeCard =
            translateDatabase("58".tr, settingsData[0]['settings_bodyhome']);
        deliverTime = settingsData[0]['settings_deliverytime'].toString();
        myServices.sharedPref.setString("deliverytime", deliverTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToPageItems(categories, selectedCat, categoryId) {
    Get.toNamed(
      AppRotes.itemsHomePage,
      arguments: {
        "categories": categories,
        "selectedcat": selectedCat,
        "catid": categoryId,
      },
    );
  }

  refreshPage() {
    getData();
    update();
  }

  goToPageProductDetails(itemsModel) {
    print(
        "Get.currentRoute ================================ ${Get.currentRoute}");
    print(
        "Get.previousRoute ================================ ${Get.previousRoute}");
    Get.toNamed(AppRotes.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
