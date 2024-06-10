import 'package:ecommerce_app2/controller/auth/successsignup_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backGround,
        elevation: 0.0,
        title: Text(
          "34".tr,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(),
        ),
        centerTitle: true,
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
            controller.checkIndex == "one"
                ? Text(
                    "174".tr,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 20.0, color: AppColor.secondColor),
                  )
                : Text(
                    "30".tr,
                    style: Theme.of(context).textTheme.headlineLarge,
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
            /* const SizedBox(
              height: 30,
            ) */
          ],
        ),
      ),
    );
  }
}
