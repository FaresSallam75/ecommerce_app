import 'package:ecommerce_app2/core/constant/theme.dart';
import 'package:ecommerce_app2/core/function/fcmc.config.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyLocalController extends GetxController {
  late Locale language;
  MyServices myServices = Get.find();
  ThemeData appTheme = themeEnglish;
  String? shredPrefLang;

  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("98".tr, "167".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("98".tr, "168".tr);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("98".tr, "169".tr);
      await Geolocator.openAppSettings();
      //  exit(0);
    }

     requestPermissionNotifications();
    fcmsConfigration();
    
  }

  @override
  void onInit() {
    super.onInit();
 
    requestPermissionLocation();
    shredPrefLang = myServices.sharedPref.getString("lang");
    if (shredPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (shredPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
/*  if (Get.deviceLocale!.languageCode == "ar") {
        language = Locale(Get.locale!.languageCode);
      } else if (Get.deviceLocale!.languageCode == "en") {
        language = Locale(Get.locale!.languageCode);
      } else {
        language = Locale(Get.deviceLocale!.languageCode);
      } */

/* 
language = myServices.sharedPref.getString("lang") == null
        ? Get.deviceLocale!
        : Locale(myServices.sharedPref.getString("lang")!); */