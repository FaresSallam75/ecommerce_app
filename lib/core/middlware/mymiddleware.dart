import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/localization/changetranslation.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;
  MyLocalController controller = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPref.getString("step") == "2") {
      return const RouteSettings(name: AppRotes.homePage);
    }
    if (myServices.sharedPref.getString("step") == "1") {
      return const RouteSettings(name: AppRotes.login);
    }
    /* if (controller.shredPrefLang!.isNotEmpty ) {
      return const RouteSettings(name: AppRotes.homePage);
    } */

    return null;
  }
}
