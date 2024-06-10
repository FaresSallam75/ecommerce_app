import 'package:ecommerce_app2/controller/settings/setting_details_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeUserImageProfile extends StatelessWidget {
  const ChangeUserImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsDetailsController());
    return Scaffold(
      backgroundColor: AppColor.backGround.withOpacity(0.8),
      body: GetBuilder<SettingsDetailsController>(
        builder: (controller) => Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColor.secondColor,
                  ),
                ),
              ),
              Text(
                "157".tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontFamily: "sans",
                    color: AppColor.secondColor),
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: controller.file != null
                        ? CircleAvatar(
                            backgroundImage: FileImage(controller.file!),
                            radius: 150,
                          )
                        : controller.userModel.image == ""
                            ? CircleAvatar(
                                backgroundImage: const AssetImage(
                                    "assets/images/user80.png"),
                                // backgroundImage: const NetworkImage(AppLink.defaultImage),
                                //backgroundColor: AppColor.black,
                                radius: 150,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: 25,
                                      right: 40,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColor.secondColor,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.chooseImageOption();
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            color: AppColor.backGround,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : InkWell(
                                onTap: () {
                                  controller.chooseImageOption();
                                },
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${AppLink.usersImage}/${controller.userModel.image}"),
                                  radius: 150,
                                ),
                              ),
                  ),
                  if (controller.isLoading == true)
                    const Positioned(
                      top: 0.0,
                      bottom: 0.0,
                      right: 0.3,
                      left: 0.3,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColor.secondColor,
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              /* CustomButtonAuth(
                    text: "Sign Up",
                    onBressed: () {
                      controller.signUp();
                    },
                  ), */
              if (controller.file != null)
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minWidth: Get.width - 80,
                  height: 50,
                  color: AppColor.secondColor,
                  textColor: AppColor.backGround,
                  onPressed: () {
                    controller.editData();
                  },
                  child: Text(
                    "158".tr,
                    style: const TextStyle(fontSize: 16, fontFamily: "sans"),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
