import 'package:ecommerce_app2/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_app2/controller/items/items_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/view/screen/homepage/search_item.dart';
import 'package:ecommerce_app2/view/widget/customhomepage.dart';
import 'package:ecommerce_app2/view/widget/items/customlistitems.dart';
import 'package:ecommerce_app2/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsHomePage extends StatelessWidget {
  const ItemsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text("66".tr , style: Theme.of(context).appBarTheme.titleTextStyle,),
            //centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.offAllNamed(AppRotes.homePage);
                // Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          )
        ],
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    CustomAppBar(
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
                    const SizedBox(height: 100),
                  ],
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      const ListCategoriesItems(),
                      GetBuilder<ItemsControllerImp>(
                        builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: !controller.isSearch
                              ? GridView.builder(
                                  itemCount: controller.data.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    controllerFav.isFavorite[
                                            controller.data[index].itemsId] =
                                        controller.data[index].favorite;
                                    return CustomListItems(
                                      itemsModel: (controller.data[index]),
                                    );
                                  },
                                )
                              : ListItemsSearch(
                                  listDataModel: controller.listData),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
