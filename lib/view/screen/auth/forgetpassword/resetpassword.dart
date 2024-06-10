import 'package:ecommerce_app2/controller/forgetpassword/resetpassword_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/validinput.dart';
import 'package:ecommerce_app2/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce_app2/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app2/view/widget/auth/customtexttitleaith.dart';
import 'package:ecommerce_app2/view/widget/auth/custtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends GetView<ResetPasswordComtrollerImp> {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordComtrollerImp());
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColor.backGround,
        //  elevation: 0.0,
        title: Text(
          "44".tr,
          /*   style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey), */
        ),
        // centerTitle: true,
      ),
      body: HandlingDataReques(
        statusRequest: controller.statusRequest,
        widget: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextTitlleAuth(text: "37".tr),
                const SizedBox(
                  height: 15,
                ),
                CutstomBodyAuth(text: "36".tr),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<ResetPasswordComtrollerImp>(
                  builder: (controller) => CustoemTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "23".tr);
                    },
                    labl: "23".tr,
                    hinText: "15".tr,
                    iconData: Icons.lock_outline,
                    myController: controller.password,
                    obscuretext: controller.isShowPassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                  ),
                ),
                GetBuilder<ResetPasswordComtrollerImp>(
                  builder: (controller) => CustoemTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "23".tr);
                    },
                    labl: "23".tr,
                    hinText: "45".tr,
                    iconData: Icons.lock_outline,
                    myController: controller.rePassword,
                    obscuretext: controller.isShowRePassword,
                    onTapIcon: () {
                      controller.showRePassword();
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomButtonAuth(
                  text: "35".tr,
                  onBressed: () {
                    controller.resetPassword();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
