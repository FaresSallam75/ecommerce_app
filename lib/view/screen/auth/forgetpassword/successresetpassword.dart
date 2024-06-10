import 'package:ecommerce_app2/controller/auth/successresetpassword_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backGround,
        // elevation: 0.0,
        title: Text("34".tr,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColor.secondColor)),
        //centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.orange,
            ),
            const SizedBox(height: 30.0),
            Text(
              textAlign: TextAlign.center,
              "38".tr,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontSize: 20.0, color: AppColor.secondColor),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "33".tr,
                onBressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            /*  const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
