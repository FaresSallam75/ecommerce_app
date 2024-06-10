import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // MyServices myServices = Get.find();
 // MyLocalController controller = Get.put(MyLocalController());
    return AnimatedSplashScreen(

      curve: Curves.easeOut,
      splash: Lottie.asset("assets/lottie/basket.json"),
      backgroundColor: AppColor.secondColor,
      animationDuration: const Duration(seconds: 4),
      splashIconSize: 250,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.scale,
      duration: 3000, 
      nextRoute: AppRotes.language,
      // ignore: unrelated_type_equality_checks
      nextScreen: Container(),
    );
  }
}
