import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/localization/changetranslation.dart';
import 'package:ecommerce_app2/view/widget/language/custombuttonlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.put(MyLocalController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              // ignore: deprecated_member_use
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomeButtonLanguage(
              textButton: "46".tr,
              onBressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRotes.onBoarding);
              },
            ),
            CustomeButtonLanguage(
              textButton: "47".tr,
              onBressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRotes.onBoarding);
              },
            )
          ],
        ),
      ),
    );
  }
}
