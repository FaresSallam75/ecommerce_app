import 'package:ecommerce_app2/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_app2/controller/offers/offers_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/view/screen/homepage/search_item.dart';
import 'package:ecommerce_app2/view/widget/customhomepage.dart';
import 'package:ecommerce_app2/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
          const SizedBox(height: 2),
          Text(
            "108".tr,
            style: const TextStyle(color: AppColor.secondColor),
          ),
          Flexible(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: false,
              header: const WaterDropHeader(),
              onRefresh: controller.onRefresh,
              onLoading: controller.onLoading,
              controller: controller.refreshController,
              footer: controller.custom(
                SizedBox(
                  height: 100.0,
                  child: Center(child: controller.body),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  GetBuilder<OffersController>(
                    builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: !controller.isSearch
                          ? GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.5,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                controllerFav.isFavorite[controller.data[index]
                                    .itemsId] = controller.data[index].favorite;
                                return CustomListItemsOffers(
                                  itemsModel: (controller.data[index]),
                                );
                              },
                            )
                          : ListItemsSearch(listDataModel: controller.listData),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
