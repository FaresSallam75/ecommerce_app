import 'package:ecommerce_app2/controller/cart/cart_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/widget/cart/buttonorder.dart';
import 'package:ecommerce_app2/view/widget/cart/custombuttoncoupon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavigationbarCart extends GetView<CartController> {
  final String price;
  final String discount;
  // final String shipping;
  final String totalPrice;
  final TextEditingController controllerCoupon;
  final void Function()? onBressedApply;

  const CustomButtonNavigationbarCart({
    super.key,
    required this.price,
    required this.discount,
    // required this.shipping,
    required this.totalPrice,
    required this.controllerCoupon,
    required this.onBressedApply,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartController>(
          builder: (controller) => controller.couponName == null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColor.black,
                            fontSize: 17,
                          ),
                          controller: controllerCoupon,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            hintText: "75".tr,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                              fontSize: 17,
                            ),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.black)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomeButtonCoupon(
                            textButton: "74".tr, onBressed: onBressedApply),
                      )
                    ],
                  ),
                )
              : Text(
                  " رمز الكوبون =>  ${controller.couponName}".tr,
                  style: Theme.of(context)
                      .textTheme
                      // ignore: deprecated_member_use
                      .headlineLarge!
                      .copyWith(color: AppColor.secondColor),
                ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.secondColor, width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "76".tr,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$price \$",
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "sans",
                          // color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "70".tr,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$discount %",
                      style: const TextStyle(
                          fontFamily: "sans",
                          fontSize: 18,
                          //color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              if (controller.discountCoupon != 0)
                Text(
                  "77".tr,
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              const SizedBox(
                height: 10,
              ),
              /*    Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "Shipping",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$shipping \$",
                      style: const TextStyle(
                          fontFamily: "sans",
                          fontSize: 18,
                          //color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ), */
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: AppColor.black, thickness: 1),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "78".tr,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "$totalPrice \$ ",
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColor.secondColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        if (controller.data.isNotEmpty)
          CustomeButtonCart(
            textButton: "79".tr,
            onBressed: () {
              controller.goTpPageCheckout(controller.data[0]);
            },
          ),
      ],
    );
  }
}
