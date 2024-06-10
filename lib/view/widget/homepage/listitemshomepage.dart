import 'package:ecommerce_app2/controller/homepage/homepage_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListItemsHomePage extends GetView<HomePageControllerImp> {
  const ListItemsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Items(
          itemsModel: controller.items[index],
        ),
      ),
    );
  }
}

class Items extends GetView<HomePageControllerImp> {
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 200,
            decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.1),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.only(top: 25, bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Image.network(
              "${AppLink.imageItems}/${itemsModel.itemsImage}",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 7,
            left: 30,
            right: 30,
            child: Container(
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  "${translateDatabase("${itemsModel.itemsNameAr}", "${itemsModel.itemsName}")}",
                  //"${itemsModel.itemsName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black.withOpacity(0.9)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
