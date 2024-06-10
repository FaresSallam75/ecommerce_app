import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_app2/controller/offers/offers_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItemsOffers extends GetView<OffersController> {
  final ItemsModel itemsModel;
  const CustomListItemsOffers({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OffersController offersController = Get.put(OffersController());
    return InkWell(
      onTap: () {
        Get.toNamed(AppRotes.itemsDetails,
            arguments: {"itemsmodel": itemsModel});
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${itemsModel.itemsImage!}",
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                    style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${itemsModel.itemsPriceDiscount}",
                        style: const TextStyle(
                            color: AppColor.secondColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: "sans"),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isFavorite[itemsModel.itemsId!] ==
                                "1") {
                              controller.setFavorite(itemsModel.itemsId!, "0");
                              controller.removeFavorite(itemsModel.itemsId!);
                            } else {
                              controller.setFavorite(itemsModel.itemsId!, "1");
                              controller.addFavorite(itemsModel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isFavorite[itemsModel.itemsId!] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          ),
                          color: AppColor.secondColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (itemsModel.itemsDiscount != "0")
              Positioned(
                top: 0.2,
                left: 0.1,
                child: Image.asset(
                  "assets/images/sale.jpg",
                  width: 35,
                  fit: BoxFit.fill,
                ),
              )
          ],
        ),
      ),
    );
  }
}
