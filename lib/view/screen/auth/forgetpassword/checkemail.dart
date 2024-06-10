import 'package:ecommerce_app2/controller/forgetpassword/checkemail_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/validinput.dart';
import 'package:ecommerce_app2/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce_app2/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app2/view/widget/auth/customtexttitleaith.dart';
import 'package:ecommerce_app2/view/widget/auth/custtextformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: AppColor.backGround,
        //  elevation: 0.0,
        title: Text(
          "16".tr,
          /*      style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.grey), */
        ),
        //  centerTitle: true,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(
        builder: (controller) => HandlingDataReques(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: ListView(
                children: [
                  CustomTextTitlleAuth(text: "29".tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CutstomBodyAuth(text: "31".tr),
                  const SizedBox(
                    height: 30,
                  ),
                  CustoemTextFormAuth(
                    //obscuretext: controller.isShowPassword,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "21".tr);
                    },
                    labl: "21".tr,
                    hinText: "14".tr,
                    iconData: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomButtonAuth(
                    text: "32".tr,
                    onBressed: () {
                      controller.checkemail();
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
      ),
    );
  }
}
