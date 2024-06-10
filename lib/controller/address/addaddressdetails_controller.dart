// ignore_for_file: invalid_use_of_protected_member

import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/address/address_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressDetailsController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  double? latt;
  double? long;
  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  initialData() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    latt = Get.arguments['latt'];
    long = Get.arguments['long'];
    print("lat lat =======================  $latt");
    print("long long =======================  $long");
  }

  @override
  void onInit() {
    super.onInit();
    initialData();
    update();
  }

  @override
  void dispose() {
    super.dispose();
    name!.dispose();
    city!.dispose();
    street!.dispose();
    formState.currentState!.dispose();
  }

  addAddressData() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
        myServices.sharedPref.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        latt.toString(),
        long.toString(),
      );
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRotes.homePage);
          Get.snackbar("Message", "Now, You Can Order to This Address");
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: "alert",
        middleText: "Not Valid Input",
      );
    }
  }
}
