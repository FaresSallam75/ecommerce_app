import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/screen/payment/pay_online.dart';
import 'package:ecommerce_app2/view/screen/payment/paypal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showBottomSheetMenu() {
  Get.bottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    backgroundColor: AppColor.secondColor.withOpacity(0.9),
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Choose Payment",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColor.backGround,
                  fontFamily: "sans",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const PayPalOnline());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    /*    Icon(
                      Icons.paypal_outlined,
                      size: 30,
                      color: AppColor.backGround,
                    ), */
                    Image.asset("assets/images/p1.png",
                        color: AppColor.backGround, height: 50, width: 50),
                    const SizedBox(width: 20),
                    const Text(
                      "PayPal",
                      style: TextStyle(
                        fontFamily: "sans",
                        color: AppColor.backGround,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => const PaymentOnline());
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    /*     Icon(
                      Icons.payment_outlined,
                      size: 30,
                      color: AppColor.black,
                    ), */
                    Image.asset("assets/images/g2.png",
                        color: AppColor.backGround, height: 50, width: 50),
                    const SizedBox(width: 20),
                    const Text(
                      "Google Pay",
                      style: TextStyle(
                        fontFamily: "sans",
                        color: AppColor.backGround,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
