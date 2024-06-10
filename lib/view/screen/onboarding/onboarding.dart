import 'package:ecommerce_app2/controller/onboarding_controller.dart';
import 'package:ecommerce_app2/view/widget/onboarding/custombutton.dart';
import 'package:ecommerce_app2/view/widget/onboarding/dotcontroller.dart';
import 'package:ecommerce_app2/view/widget/onboarding/pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 2,
              child: PageViewOnBoarding(),
            ),
            DotControllerOnBoarding(),
            SizedBox(height: 20),
            CustomButtonOnBoarding(),
          ],
        ),
      ),
    );
  }
}
