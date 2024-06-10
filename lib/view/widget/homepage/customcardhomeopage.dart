import 'package:ecommerce_app2/controller/homepage/homepage_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHomePage extends GetView<HomePageControllerImp> {
  final String titleText;
  final String subTitleText;
  const CustomCardHomePage(
      {super.key, required this.titleText, required this.subTitleText});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 130,
            decoration: BoxDecoration(
              color: AppColor.orange,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              title: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  titleText,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColor.backGround,
                    fontFamily: 'TheGirlNextDoor',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              isThreeLine: true,
              subtitle: Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  subTitleText,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColor.backGround,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TheGirlNextDoor",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -10,
            //bottom: -20,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)
                  /*     borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250),
                  topRight: Radius.circular(250),
                  bottomLeft: Radius.circular(250),
                  topLeft: Radius.circular(250),
                ), */
                  ),
            ),
          ),
          /*      Positioned(
            top: 0.0,
            bottom: 0.0,
            right: 50,
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: AppColor.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250),
                  topRight: Radius.circular(250),
                  bottomLeft: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
            ),
          ) */
        ],
      ),
    );
  }
}


/* 
  
  ListTile(
              title: Text(
                titleText,
                style:
                    const TextStyle(fontSize: 16, color: AppColor.backGround),
              ),
              subtitle: Text(
                subTitleText,
                style:
                    const TextStyle(fontSize: 23, color: AppColor.backGround),
              ),
            ),

 */