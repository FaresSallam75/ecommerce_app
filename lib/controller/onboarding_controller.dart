import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  nextPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentValue = 0;
  late PageController pageController;
  MyServices myServices = Get.find();
  
  @override
  next() {
    currentValue++;
    if (currentValue > onBordingList.length - 1) {
      myServices.sharedPref.setString("step", "1");
      Get.offAllNamed(AppRotes.login);
    } else {
      pageController.animateToPage(currentValue,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  nextPageChanged(int index) {
    currentValue = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
