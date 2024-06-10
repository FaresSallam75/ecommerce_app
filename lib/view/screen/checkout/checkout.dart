import 'package:ecommerce_app2/controller/checkout/checkout_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/imageasset.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/view/widget/checkout/cardcheckoutdelivery.dart';
import 'package:ecommerce_app2/view/widget/checkout/cardcheckoutpayment.dart';
import 'package:ecommerce_app2/view/widget/checkout/shippingaddresscheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: MaterialButton(
          height: 40,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: AppColor.secondColor,
          textColor: AppColor.backGround,
          onPressed: () {
            controller.paymentMethod == "1"
                ? controller.bottomSheetPaymetMethod()
                : controller.checkout();
          },
          child: Text(
            "80".tr,
            style: Theme.of(context)
                .textTheme
                // ignore: deprecated_member_use
                .headlineLarge!
                .copyWith(color: AppColor.backGround, fontSize: 20.0),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("80".tr),
        centerTitle: true,
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                textAlign: TextAlign.center,
                "81".tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondColor),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  controller.choosePaymentMethod("0"); // 0 => cash
                },
                child: CardCheckoutPaymentMethod(
                  title: "82".tr,
                  active: controller.paymentMethod == "0" ? true : false,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  controller.choosePaymentMethod("1"); // 1 => card
                  //controller.payPalCard();
                },
                child: CardCheckoutPaymentMethod(
                  title: "83".tr,
                  active: controller.paymentMethod == "1" ? true : false,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                textAlign: TextAlign.center,
                "84".tr,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.secondColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      controller.chooseDeliveyType("0"); //  0 => delivery
                      print(
                          "=========== delivery ============ ${controller.deliveryType}");
                    },
                    child: CardCheckoutDelivery(
                        title: "85".tr,
                        image: AppImageAsset.deliveryCar,
                        active: controller.deliveryType == "0" // 0 => delivery
                            ? true
                            : false),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      controller.chooseDeliveyType("1"); // 1 => recieve
                      print(
                          "=========== recieve ============ ${controller.deliveryType}");
                    },
                    child: CardCheckoutDelivery(
                        title: "86".tr,
                        image: AppImageAsset.recieve,
                        active: controller.deliveryType == "1" ? true : false),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (controller.deliveryType == "0")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (controller.listData.isNotEmpty)
                      Text(
                        "87".tr,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondColor),
                      ),
                    if (controller.listData.isEmpty)
                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRotes.addressAdd);
                        },
                        child: const Center(
                          child: Text(
                            "Please Add Shipping Address \n Click Here",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondColor),
                          ),
                        ),
                      ),
                    const SizedBox(height: 10),
                    ...List.generate(
                      controller.listData.length,
                      (index) => InkWell(
                        onTap: () {
                          controller.chooseShippingAddress(
                              controller.listData[index].addressId!);
                        },
                        child: CardShippingAddressCheckout(
                          titleOne: "${controller.listData[index].addressName}",
                          titleTwo:
                              "${controller.listData[index].addressCity}  ${controller.listData[index].addressStreet} ",
                          active: controller.addressId ==
                                  controller.listData[index].addressId
                              ? true
                              : false,
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
