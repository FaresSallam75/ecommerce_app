import 'package:ecommerce_app2/controller/settings/setting_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomStackImage extends StatelessWidget {
  const CustomStackImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (controller) => Card(
        child: Container(
          clipBehavior: Clip.none,
          height: Get.height / 4,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.secondColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          //margin: EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.only(top: 50, left: 3, right: 5),
          // margin: const EdgeInsets.only(bottom: 50),

          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.userModelList.length,
            itemBuilder: (context, index) => Stack(
              alignment: Alignment.topLeft,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.grey.shade300,
                      ),
                      child: controller.userModelList[index].image! != ""
                          ? CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                "${AppLink.usersImage}/${controller.userModelList[index].image!}",
                              ),
                            )
                          : const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user80.png"),
                              // backgroundColor: AppColor.black,
                              radius: 40,
                              /*   child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    bottom: -2,
                                    right: -9,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColor.black,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppColor.backGround,
                                      ),
                                    ),
                                  )
                                ],
                              ), */
                            ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Text("${controller.userModelList[index].usersName}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor
                                        .thirdColor) /* const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColor.backGround,
                          ), */
                            ),
                        Text("${controller.userModelList[index].usersEmail}",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor
                                        .thirdColor) /* const TextStyle(
                            color: AppColor.backGround,
                            fontSize: 16,
                          ), */
                            ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        controller.goToSettingDetailsPage(
                            controller.userModelList[index]);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: AppColor.backGround,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 

 /* Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.green,
                    Colors.yellow,
                    Colors.red,
                    Colors.purple
                  ]),
                  shape: BoxShape.circle),
              child: Padding(
                //this padding will be you border size
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    foregroundImage: AssetImage("assets/images/user80.png"),
                  ),
                ),
              ),
            ), */