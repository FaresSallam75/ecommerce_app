import 'package:ecommerce_app2/controller/settings/setting_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return GetBuilder<SettingsController>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Column(
          children: [
            // const CustomStackImage(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.userModelList.length,
              itemBuilder: (context, index) => Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: Get.width / 3,
                  ),
                  Positioned(
                    top: Get.width / 7.5,
                    child: InkWell(
                      onTap: () {
                        controller.goToSettingDetailsPage(
                            controller.userModelList[0]);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: AppColor.thirdColor.withOpacity(0.9),
                        ),
                        child: controller.userModelList[index].image! != ""
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                  "${AppLink.usersImage}/${controller.userModelList[index].image!}",
                                ),
                              )
                            : controller.myServices.sharedPref
                                        .getString("googlePhoto")! !=
                                    ""
                                ? CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                      controller.myServices.sharedPref
                                          .getString("googlePhoto")!,
                                    ),
                                  )
                                : const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/user80.png"), //
                                    // backgroundColor: Colors.grey.shade300,
                                    radius: 50,
                                  ),
                      ),
                    ),
                  ),
                  /*  Positioned(
                          right: 0.2,
                          top: 60,
                          child: InkWell(
                            onTap: () {
                              controller.goToSettingDetailsPage(
                                  controller.userModelList[0]);
                            },
                            child: const Icon(
                              Icons.edit,
                              color: AppColor.backGround,
                            ),
                          ),
                        ), */
                ],
              ),
            ),
            const SizedBox(height: 50),
            Text(
                controller.myServices.sharedPref.getString("username") ??
                    controller.myServices.sharedPref.getString("googleName")!,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.secondColor)),
            Text(
                controller.myServices.sharedPref.getString("email") ??
                    controller.myServices.sharedPref.getString("googleEmail")!,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColor.secondColor)),
            const SizedBox(height: 20),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                onTap: () {},
                                title: Text("109".tr),
                                trailing: Switch(
                                  activeColor: AppColor.secondColor,
                                  value: controller.myServices.sharedPref
                                          .getBool("va") ??
                                      controller.isVal,
                                  onChanged: (val) {
                                    controller.changeVal(val);
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text("110".tr),
                                trailing: Switch(
                                  activeColor: AppColor.secondColor,
                                  value: controller.myServices.sharedPref
                                          .getBool("color") ??
                                      controller.isDarkMode,
                                  onChanged: (val) {
                                    controller.changeColorMode(val);
                                  },
                                ),
                              ),
                              ListTile(
                                onTap: () async {
                                  await Get.toNamed(AppRotes.pendingOrders);
                                },
                                title: Text("111".tr),
                                trailing: const Icon(Icons.card_travel),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.toNamed(AppRotes.ordersArchieved);
                                },
                                title: Text("112".tr),
                                trailing: const Icon(Icons.card_travel),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.toNamed(AppRotes.addressView);
                                },
                                title: Text("113".tr),
                                trailing:
                                    const Icon(Icons.location_on_outlined),
                              ),
                              ListTile(
                                onTap: () {
                                  Get.toNamed(AppRotes.couponPage);
                                },
                                title: Text("114".tr),
                                trailing: const Icon(Icons.countertops),
                              ),
                              ListTile(
                                onTap: () {},
                                title: Text("115".tr),
                                trailing:
                                    const Icon(Icons.help_outline_rounded),
                              ),
                              ExpansionTile(
                                title: Text('119'.tr),
                                // subtitle: Text('Trailing expansion arrow icon'),
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        controller.changeLanguage("ar");
                                      },
                                      child: Text('120'.tr,
                                          style: Theme.of(context)
                                              .textTheme
                                              // ignore: deprecated_member_use
                                              .headlineSmall!
                                              .copyWith(
                                                  color: AppColor.black))),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.changeLanguage("en");
                                    },
                                    child: Text('121'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            // ignore: deprecated_member_use
                                            .headlineSmall!
                                            .copyWith(color: AppColor.black)),
                                  ),
                                  const SizedBox(height: 7.0),
                                ],
                              ),
                              ListTile(
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse("tel:00201062873239"));
                                },
                                title: Text("116".tr),
                                trailing:
                                    const Icon(Icons.phone_callback_outlined),
                              ),
                              ListTile(
                                onTap: () {
                                  controller.logout();
                                },
                                title: Text("117".tr),
                                trailing: const Icon(Icons.logout_outlined),
                              ),
                            ],
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*       Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.secondColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: Get.width / 3,
                  ),
                  Positioned(
                    top: Get.width / 4.7,
                    child: InkWell(
                      onTap: () {
                        print("=======================================");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.grey.shade300,
                        ),
                        child: controller.myServices.sharedPref
                                    .getString("image") !=
                                ""
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "${AppLink.imageUsers}/${controller.myServices.sharedPref.getString("image")}"),
                                // backgroundColor: Colors.grey.shade300,
                                radius: 50,
                              )
                            : CircleAvatar(
                                backgroundImage: const AssetImage(
                                    "assets/images/user80.png"),
                                // backgroundColor: Colors.grey.shade300,
                                radius: 50,
                                child: Stack(
                                  fit: StackFit.expand,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: -2,
                                      right: -9,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
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
                                    ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ), */
