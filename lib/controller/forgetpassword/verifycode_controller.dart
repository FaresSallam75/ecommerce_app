import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/data/datasourse/remote/auth/verifycodesignup.dart';
import 'package:ecommerce_app2/data/datasourse/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  resendCode();
  goToResetPassword(verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  String? verifyCode;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
      VerifyCodeForgetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    getNotifyCode();
  }

  @override
  goToResetPassword(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeForgetPasswordData.postData(email!, verifyCode!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
          title: "54".tr,
          middleText: "170".tr,
        );
        verifyCode;
      }
    }
    update();
  }

  getNotifyCode() async {
    statusRequest = StatusRequest.loading;
    // update();
    var response = await verifyCodeSignUpData.getNotifyVerifyCode(email!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {}
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void checkCode(code) {
    verifyCode != code;
    code = "";
    update();
  }

  @override
  resendCode() {
    getNotifyCode();
    verifyCodeSignUpData.resendData(email!);
    update();
  }
}
