import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/data/datasourse/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode(String code);
  resendCode();
  goToSuccessSignUp(String verifyCode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  String? email;
  String? verifyCode;
  StatusRequest statusRequest = StatusRequest.none;
  String? checkIndex;

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
    checkIndex = Get.arguments['one'];
    getNotifyCode();
  }

  @override
  goToSuccessSignUp(verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verifyCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(AppRotes.successSignUp, arguments: {"one": checkIndex});
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
   update();
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
