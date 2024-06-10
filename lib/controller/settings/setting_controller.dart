import 'dart:async';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/localization/changetranslation.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/setting/updateProfileusers.dart';
import 'package:ecommerce_app2/data/model/usersmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  bool isVal = true;
  bool isDarkMode = false;
  //late bool val;
  StatusRequest statusRequest = StatusRequest.none;
  UpdateProfileUser updateProfileUser = UpdateProfileUser(Get.find());
  List<UserModel> userModelList = [];
  GoogleSignIn googleSignIn = GoogleSignIn();

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    viewData();
  }

  viewData() async {
    userModelList.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await updateProfileUser.viewUserData(
      myServices.sharedPref.getString("email") ??
          myServices.sharedPref.getString("googleEmail")!,
    );
    print("response response response ============================ $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        userModelList.addAll(responseData.map((e) => UserModel.fromJson(e)));
        print("userModelList =========================== $userModelList");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToSettingDetailsPage(UserModel userModel) {
    Get.toNamed(AppRotes.changeUserImageProfile,
        arguments: {"userModel": userModel});
  }

  changeVal(bool val) async {
    String usersid = myServices.sharedPref.getString("id")!;
    if (isVal) {
      isVal = false;
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
      FirebaseMessaging.instance.unsubscribeFromTopic("users$usersid");
      await myServices.sharedPref.setBool("va", isVal);
      Get.snackbar(
        "154".tr,
        "156".tr,
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      isVal = true;
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users$usersid");
      await myServices.sharedPref.setBool("va", isVal);
    }
    update();
  }

  changeColorMode(bool val) {
    if (!Get.isDarkMode) {
      isDarkMode = true;
      Get.changeTheme(ThemeData.dark());
      myServices.sharedPref.setBool("color", isDarkMode);
    } else {
      isDarkMode = false;
      Get.changeTheme(ThemeData.light());
      myServices.sharedPref.setBool("color", isDarkMode);
    }

    update();
  }

  logout() {
    // Locale locale = const Locale("en");
    String usersid = myServices.sharedPref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$usersid");

    googleSignIn.disconnect();
    myServices.sharedPref.clear();
    Get.offAllNamed(AppRotes.login);
  }

  refreshPage() {
    statusRequest = StatusRequest.loading;
    update();
    viewData();
    statusRequest = StatusRequest.success;
    update();
  }

  changeLanguage(String codeLanguage) async {
    MyLocalController controller = Get.find();
    controller.changeLang(codeLanguage);
    print("================================================");
    print("${myServices.sharedPref.getString("lang")} =====");
    isLoading = true;
    await Future.delayed(const Duration(seconds: 4));
    isLoading = false;
    update();
    Get.offAllNamed(AppRotes.homePage);
  }
}
