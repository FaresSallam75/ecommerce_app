import 'package:ecommerce_app2/controller/favorite/favoriteview_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/view/widget/favorite/myfavoritedesign.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteViewControllerImp controller = Get.put(FavoriteViewControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:  Text("164".tr),
        leading: IconButton(
          onPressed: () {
            // Get.back();
            controller.getBack();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: GetBuilder<FavoriteViewControllerImp>(
          builder: (controller) => ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return CustomListFavoritesItems(
                        myFavoriteModel: controller.data[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }   
}
