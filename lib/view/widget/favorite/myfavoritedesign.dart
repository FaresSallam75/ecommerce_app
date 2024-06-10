import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/controller/favorite/favoriteview_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/myfavoritemodel.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListFavoritesItems extends StatelessWidget {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoritesItems({super.key, required this.myFavoriteModel});

  @override
  Widget build(BuildContext context) {
    FavoriteViewControllerImp controller = Get.put(FavoriteViewControllerImp());

    return InkWell(
      onTap: () {
        // controller.goToPageProductDetails(itemsModel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Hero(
                  tag: "${myFavoriteModel.itemsId}",
                  child: CachedNetworkImage(
                    imageUrl:
                        "${AppLink.imageItems}/${myFavoriteModel.itemsImage!}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "${translateDatabase(myFavoriteModel.itemsNameAr, myFavoriteModel.itemsName)}",
                style: const TextStyle(
                    color: AppColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  const Text(
                    "Rating 4.5",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            size: 11,
                            color: Colors.yellow.shade900,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${myFavoriteModel.itemsPrice}",
                    style: const TextStyle(
                        color: AppColor.secondColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: "sans"),
                  ),
                  IconButton(
                    onPressed: () {
                      controller
                          .deletefavoriteData(myFavoriteModel.favoriteId!);
                    },
                    icon: const Icon(Icons.delete_outline_outlined,
                        color: AppColor.secondColor),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
