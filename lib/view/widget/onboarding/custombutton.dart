import 'package:ecommerce_app2/controller/onboarding_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 35),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 100),
        color: AppColor.secondColor,
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        child: Text(
          "2".tr,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
