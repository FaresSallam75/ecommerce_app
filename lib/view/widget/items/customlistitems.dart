import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/controller/favorite/favorite_controller.dart';
import 'package:ecommerce_app2/controller/items/items_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
/* 
    DateTime aYearAgo =
        Jiffy.parse(itemsModel.itemsDate!).fromNow() as DateTime;
    var arabicDateFormat = DateFormat('MMMM d, y', 'ar');
    String formattedDate = arabicDateFormat.format(aYearAgo); */

    String dateString = itemsModel.itemsDate!;
    DateTime date = DateTime.parse(dateString);
    var formatter = DateFormat.yMMMMd('ar');
    String formattedDate = formatter.format(date);

    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
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
                  const SizedBox(height: 7),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    // textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Icon(Icons.timer_sharp, color: AppColor.grey),
                      const SizedBox(width: 5),
                      Text(
                        // "${controller.deliveryTime} Minute",
                        translateDatabase(formattedDate,
                            Jiffy.parse(itemsModel.itemsDate!).fromNow()),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: "sans"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (itemsModel.itemsDiscount != "0")
                        Text(
                          itemsModel.itemsPrice!.toString(),
                          style: const TextStyle(
                              color: AppColor.secondColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "sans",
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.secondColor,
                              decorationThickness: 3),
                        ),
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
            // ignore: unrelated_type_equality_checks
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
