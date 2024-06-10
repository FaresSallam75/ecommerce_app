import 'package:ecommerce_app2/controller/homepage/homepage_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/data/datasourse/static/onbordinghomepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingHomePage extends GetView<HomePageControllerImp> {
  const OnBoardingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.only(top: 10),
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: onBordingHomePage.length,
          scrollDirection: Axis.horizontal,
          controller: controller.pageController,
          itemBuilder: (context, index) => Stack(children: [
            Container(
              decoration: BoxDecoration(
                color: AppColor.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.only(right: 7, left: 7),
              child: Image.asset(
                onBordingHomePage[index].image!,
                height: 160,
                width: MediaQuery.of(context).size.width - 30,
                fit: BoxFit.contain,
              ),
            ),
            /* Positioned(
              top: 2,
              left: 30,
              child: Center(
                child: Text(
                  onBordingList[index].title!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black),
                ),
              ),
            ) */
          ]),
        ),
      ),
    );
  }
}
