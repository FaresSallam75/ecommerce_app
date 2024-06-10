import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/controller/items/itemsdetails_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

class StackPageProducts extends GetView<ItemsDetailsControllerImp> {
  const StackPageProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          //margin: EdgeInsets.only(top: 20),
          height: 220,
          decoration: BoxDecoration(
            color: AppColor.greyDark.withOpacity(0.1),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
              top: Radius.circular(20),
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: Get.width / 10,
          left: Get.width / 10,
          child: Hero(
            tag: "${controller.itemsModel!.itemsId}",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                filterQuality: FilterQuality.high,
                imageUrl:
                    "${AppLink.imageItems}/${controller.itemsModel!.itemsImage!}",
                height: 280,
                width: 300,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
