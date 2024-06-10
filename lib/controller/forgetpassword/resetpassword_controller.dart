import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/data/datasourse/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordComtroller extends GetxController {
  late TextEditingController password;
  late TextEditingController rePassword;
  String? email;

  bool isShowPassword = true;
  bool isShowRePassword = true;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }
  showRePassword() {
    isShowRePassword = isShowRePassword == true ? false : true;
    update();
  }

  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordComtrollerImp extends ResetPasswordComtroller {
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRotes.successResetPassword);
  }

  @override
  resetPassword() async {
    var formData = formState.currentState;
    if (password.text != rePassword.text) {
      return Get.defaultDialog(
        title: "154".tr,
        middleText: "172".tr,
      );
    }

    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRotes.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "54".trimLeft(),
            middleText: "173".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("165".tr);
    }
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();

    super.dispose();
  }
}
