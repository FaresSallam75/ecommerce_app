import 'package:ecommerce_app2/controller/items/itemsdetails_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/core/shared/custombuttondefault.dart';
import 'package:ecommerce_app2/view/widget/itemsdetails.dart/priceandquantity.dart';
import 'package:ecommerce_app2/view/widget/itemsdetails.dart/stackpageproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  const ItemsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsDetailsControllerImp controller = Get.put(ItemsDetailsControllerImp());

    return Scaffold(
      bottomNavigationBar: GetBuilder<ItemsDetailsControllerImp>(
        builder: (controller) => Visibility(
          visible: !controller.isVisible,
          child: CustomButtonDefault(
            text: ("67".tr),
            onBressed: () {
              controller.goToCardPage();
            },
          ),
        ),
      ),
      /* Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: MaterialButton(
          height: 40,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: AppColor.secondColor,
          onPressed: () {
            // controller.cartController.refrshPage();
            controller.goToCardPage();
          },
          child: const Text(
            textAlign: TextAlign.center,
            "Go To Cart",
            style: TextStyle(
              color: AppColor.backGround,
              fontSize: 18,
              //fontWeight: FontWeight.bold
            ),
          ),
        ),
      ), */
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(
              "68".tr,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            ),
            //centerTitle: true,
            clipBehavior: Clip.hardEdge,
            leading: IconButton(
              onPressed: () {
                if (Get.currentRoute == "/homepage" ||
                    Get.previousRoute == "/homepage") {
                  Get.back();
                } else {
                  Get.offNamed(AppRotes.itemsHomePage);
                }
                // Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          )
        ],
        body: GetBuilder<ItemsDetailsControllerImp>(
          builder: (controlle) => Container(
            child: HandlingDataView(
              statusRequest: controlle.statusRequest,
              widget: SafeArea(
                child: ListView(
                  //  controller: controlle.scrollController,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    /*      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back),
                          ),
                          const Text("Items Details")
                        ],
                      ), */
                    const StackPageProducts(),
                    const SizedBox(
                      height: 130,
                    ),
                    /* controller.itemsModel!.itemsCount != "0"
                            ? Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "availlable in Stock ", // ${controller.itemsModel!.itemsCount}
                                  // ignore: deprecated_member_use
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "sana",
                                        color: AppColor.secondColor,
                                        fontSize: 17,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 1.5,
                                        decorationColor: AppColor.black,
                                      ),
                                ),
                              )
                            :  */
                    if (controller.itemsModel!.itemsCount == "0")
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "69".tr,
                          // ignore: deprecated_member_use
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "sana",
                                    color: AppColor.secondColor,
                                    fontSize: 17,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1.5,
                                    decorationColor: AppColor.black,
                                  ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${translateDatabase(controlle.itemsModel!.itemsNameAr, controlle.itemsModel!.itemsName)}",
                              style: Theme.of(context)
                                  .textTheme
                                  // ignore: deprecated_member_use
                                  .headlineMedium!
                              /*    .copyWith(
                                    color: AppColor.greyDark,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic), */
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          PriceAndQuantity(
                            price:
                                "${controller.itemsModel!.itemsPriceDiscount}",
                            quantity: "${controller.countItems}",
                            onAdd: () {
                              controller.increment();
                              // controller.refreshCount();
                            },
                            onRemove: () {
                              controller.decrement();
                            },
                            discount: controller.itemsModel!.itemsDiscount!,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            textAlign: TextAlign.start,
                            "${translateDatabase(controlle.itemsModel!.itemsDescAr, controlle.itemsModel!.itemsDesc)}  ",
                            style: Theme.of(context)
                                .textTheme
                                // ignore: deprecated_member_use
                                .bodyLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.greyDark,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          /* Text(
                                    "Color",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(color: AppColor.blueDark),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const SublistProducts(), */
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
