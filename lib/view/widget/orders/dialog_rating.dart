import 'package:ecommerce_app2/controller/orders/archieve_orders_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showDialogRating(BuildContext context, String ordersId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title:  Text(
        '159'.tr,
        textAlign:   TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message:  Text(
        '160'.tr,
        textAlign: TextAlign.center,
        style:const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      // FlutterLogo(size: 100),
      image: Image.asset(
        AppImageAsset.logo,
        height: 100,
        width: 100,
       
      ),
      submitButtonText: '161'.tr,
      submitButtonTextStyle: const TextStyle(
          color: AppColor.secondColor, fontWeight: FontWeight.bold),
      commentHint: '162'.tr,
      onCancelled: () => print('163'.tr),
      onSubmitted: (response) {
        // print('rating: ${response.rating}, comment: ${response.comment}');
        ArchieveOrdersController controller = Get.find();
        controller.ratingOrders(ordersId, response.rating, response.comment);
      },
    ),
  );
}
