import 'package:ecommerce_app2/controller/cart/cart_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/view/widget/cart/botton_navigationbar_cart.dart';
import 'package:ecommerce_app2/view/widget/cart/customcartlist.dart';
import 'package:ecommerce_app2/view/widget/cart/topcartcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (cartController.myServices.sharedPref.getString("rote") ==
                  "1") {
                return Get.back();
              } else {
                cartController.goToPageItemsDetails();
              }
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(
          "71".tr,
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        //centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => CustomButtonNavigationbarCart(
          controllerCoupon: controller.controllerCoupon!,
          onBressedApply: () {
            controller.couponCheck();
          },
          price: "${cartController.priceOrder}",
          discount: "${controller.discountCoupon}",
          //shipping:  "0",
          totalPrice: "${controller.getTotalPrice()} ",
        ),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(height: 10),
              TopCartCart(
                title:
                    "${"72".tr} ${cartController.totalCountItems} ${"73".tr}",
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ...List.generate(cartController.data.length, (index) {
                      return CustomCartList(
                        onPressedAdd: () async {
                          cartController.checkItmeCount =
                              int.parse(cartController.data[index].itemsCount!);

                          cartController.checkCount =
                              int.parse(cartController.data[index].countitems!);
                          await cartController
                              .addCart(cartController.data[index].itemsId!);
                          cartController.refrshPage();
                        },
                        onPressedRemove: () async {
                          await cartController
                              .deleteCart(cartController.data[index].itemsId!);
                          cartController.refrshPage();
                        },
                        nameProduct:
                            "${translateDatabase(cartController.data[index].itemsNameAr, cartController.data[index].itemsName)}",
                        priceProduct:
                            "${cartController.data[index].itemsprice} \$",
                        numberProduct:
                            "${cartController.data[index].countitems}",
                        iamgeName: "${cartController.data[index].itemsImage}",
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
