import 'package:ecommerce_app2/controller/address/addaddressdetails_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/validinput.dart';
import 'package:ecommerce_app2/core/shared/custombuttondefault.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/auth/custtextformfield.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    AddAddressDetailsController controller =
        Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("125".tr),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.secondColor,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustoemTextFormAuth(
                      labl: "126".tr,
                      hinText: "126".tr,
                      iconData: Icons.type_specimen,
                      myController: controller.name!,
                      valid: (val) {
                        return validInput(val!, 5, 100, "Name");
                      },
                      isNumber: false),
                  CustoemTextFormAuth(
                      labl: "127".tr,
                      hinText: "127".tr,
                      iconData: Icons.location_on,
                      myController: controller.city!,
                      valid: (val) {
                        return validInput(val!, 5, 100, "city");
                      },
                      isNumber: false),
                  CustoemTextFormAuth(
                      labl: "128".tr,
                      hinText: "128".tr,
                      iconData: Icons.streetview,
                      myController: controller.street!,
                      valid: (val) {
                        return validInput(val!, 5, 100, "street");
                      },
                      isNumber: false),
                  CustomButtonDefault(
                    text: "129".tr,
                    onBressed: () {
                      controller.addAddressData();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
