import 'package:ecommerce_app2/controller/homepage/homepage_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/view/screen/homepage/search_item.dart';
import 'package:ecommerce_app2/view/widget/customhomepage.dart';
import 'package:ecommerce_app2/view/widget/homepage/customcardhomeopage.dart';
import 'package:ecommerce_app2/view/widget/homepage/customtitlehomepage.dart';
import 'package:ecommerce_app2/view/widget/homepage/listcategorieshomepage.dart';
import 'package:ecommerce_app2/view/widget/homepage/listitemshomepage.dart';
import 'package:ecommerce_app2/view/widget/homepage/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Stack(
              children: [
                SafeArea(
                  child: CustomAppBar(
                    myController: controller.search,
                    onChanged: (val) {
                      controller.checkSearchItems(val);
                    },
                    titleAppBar: "56".tr,
                    onPressedIconSearch: () {
                      if (controller.search.text != "") {
                        controller.onSearchIcons();
                      } else {
                        controller.showSnack();
                      }
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRotes.myFavorite);
                    },
                  ),
                ),
              ],
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomCardHomePage(
                                titleText: controller.titleHomeCard,
                                subTitleText: controller.bodyHomeCard,
                              ),
                              CustomTitleHomePage(title: "59".tr),
                              const OnBoardingHomePage(),
                              CustomTitleHomePage(title: "60".tr),
                              const ListCategoriesHomePage(),
                              if (controller.items.isNotEmpty)
                                CustomTitleHomePage(title: "61".tr),
                              if (controller.items.isNotEmpty)
                                const ListItemsHomePage(),
                            ],
                          )
                        : ListItemsSearch(listDataModel: controller.listData),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
