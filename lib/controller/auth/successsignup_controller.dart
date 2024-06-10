import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  String? checkIndex ;

  @override
  void onInit() {
    super.onInit();
    checkIndex = Get.arguments['one'];
    print("checkIndex checkIndex checkIndex =================== $checkIndex");
  } 

  @override
  goToPageLogin() {
    Get.offAllNamed(AppRotes.login);
  }
}
