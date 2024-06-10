import 'package:ecommerce_app2/view/screen/homepage/home.dart';
import 'package:ecommerce_app2/view/screen/notifications/notifications.dart';
import 'package:ecommerce_app2/view/screen/offers/offers.dart';
import 'package:ecommerce_app2/view/screen/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomePageScreenController extends GetxController {
  changePage(int currentPage);
}

class HomePageScreenControllerImp extends HomePageScreenController {
  int currentPage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const NotificationsPage(),
    const OffersView(),
    const Settings()
  ];

  //List textButtonAppBar = ["48".tr, "49".tr, "50".tr, "51".tr];
  List buttonAppBar = [
    {
      "title": "62".tr,
      "icon": Icons.home,
    },
    {
      "title": "63".tr,
      "icon": Icons.notifications_active_rounded,
    },
    {
      "title": "64".tr,
      "icon": Icons.local_offer_sharp,
    },
    {
      "title": "65".tr,
      "icon": Icons.settings,
    }
  ];

  @override
  // ignore: avoid_renaming_method_parameters
  changePage(int index) {
    currentPage = index;
    update();
  }
}
