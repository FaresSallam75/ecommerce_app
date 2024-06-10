import 'package:ecommerce_app2/controller/auth/login_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/alertexit.dart';
import 'package:ecommerce_app2/core/function/validinput.dart';
import 'package:ecommerce_app2/view/widget/auth/custombodyauth.dart';
import 'package:ecommerce_app2/view/widget/auth/custombuttonauth.dart';
import 'package:ecommerce_app2/view/widget/auth/customimageauth.dart';
import 'package:ecommerce_app2/view/widget/auth/customtexttitleaith.dart';
import 'package:ecommerce_app2/view/widget/auth/custtextformfield.dart';
import 'package:ecommerce_app2/view/widget/auth/signinauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      /* appBar: AppBar(
        title: Text("11".tr,
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle!
                .copyWith(color: AppColor.grey)),
        centerTitle: true,
      ), */
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataReques(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                children: [
                  Form(
                    key: controller.formState,
                    child: Flexible(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const CustomImageAuth(),
                          CustomTextTitlleAuth(text: "12".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CutstomBodyAuth(text: "13".tr),
                          const SizedBox(
                            height: 30,
                          ),
                          CustoemTextFormAuth(
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 100, "21".tr);
                            },
                            labl: "21".tr,
                            hinText: "14".tr,
                            iconData: Icons.email_outlined,
                            myController: controller.email,
                          ),
                          GetBuilder<LoginControllerImp>(
                            builder: (controller) => CustoemTextFormAuth(
                              obscuretext: controller.isShowPassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 4, 50, "23".tr);
                              },
                              labl: "23".tr,
                              hinText: "15".tr,
                              iconData: Icons.lock_outline,
                              myController: controller.password,
                            ),
                          ),
                          const SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              controller.goToForgetPassword();
                            },
                            child: Text(
                              "16".tr,
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          CustomButtonAuth(
                            text: "17".tr,
                            onBressed: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomeTextSignUpORSignIn(
                            textOne: "18".tr,
                            textTwo: "19".tr,
                            onTab: () {
                              controller.goToSignUpPage();
                            },
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.signInWithGoogle();
                                },
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          "assets/images/g1.png",
                                          height: 50,
                                          width: 30,
                                        ),
                                        Text(
                                          "53".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              // ignore: deprecated_member_use
                                              .headlineSmall!,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          color: AppColor.black,
                                          "assets/images/face.png",
                                          height: 50,
                                          width: 30,
                                        ),
                                        Text(
                                          "52".tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              // ignore: deprecated_member_use
                                              .headlineSmall!,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
