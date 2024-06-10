import 'dart:async';
import 'dart:io';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/fileupload.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/auth/signup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SigupController extends GetxController {
  signUp();
  goToSigninPage();
}

class SigupControllerImp extends SigupController {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  SignupData signupData = SignupData(Get.find());
  File? file;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  bool isShowPassword = true;
  bool isLoading = false;
  MyServices myServices = Get.find();

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToSigninPage() {
    Get.offNamed(AppRotes.login);
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(AppRotes.addUserImage, false);
    isLoading = true;
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera(AppRotes.addUserImage);
    isLoading = true;
    Timer.periodic(const Duration(seconds: 4), (timer) {
      isLoading = false;
      update();
    });
    update();
  }

  chooseImageOption() {
    showBottomSheetMenuImage(chooseImageGallery, chooseImageCamera);
  }

  @override
  signUp() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.signUpData(
          username.text, password.text, email.text, phone.text, file);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          String usersid = response['data'];
          FirebaseMessaging.instance.subscribeToTopic("users$usersid");
          Get.offNamed(AppRotes.verifyCodeSignUp, arguments: {
            "email": email.text
          });
        } else {
          Get.defaultDialog(
            title: "98".tr,
            middleText: "166".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("165".tr);
    }
  }

  goToImagePage() {
    // var formData = formState.currentState;
    if (formState.currentState!.validate()) {
      Get.toNamed(AppRotes.addUserImage);
    } else {
      // print("Not Valid");
      Get.defaultDialog(title: "98".tr, middleText: "165".tr);
    }
  }
}
