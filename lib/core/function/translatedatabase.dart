import 'package:ecommerce_app2/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPref.getString("lang") == "ar") {
    return columnAr;
  } else if (myServices.sharedPref.getString("lang") == "en") {
    return columnEn;
  } else {
    if (Get.locale!.languageCode == "ar") {
      return columnAr;
    } else {
      return columnEn;
    }
  }
}
