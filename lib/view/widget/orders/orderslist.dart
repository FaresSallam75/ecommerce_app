import 'package:ecommerce_app2/controller/orders/pending_orders_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrders extends GetView<PendingOrdersController> {
  final OrdersModel ordersModel;
  const CardOrders({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${"138".tr}: ${ordersModel.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  Jiffy.parse("${ordersModel.ordersDatetime}").fromNow(),
                  // Jiffy(ordersModel.ordersDatetime, "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      color: AppColor.secondColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                "${"139".tr}: ${controller.printOrderType(ordersModel.ordersType!)}"),
            Text(
              "${"140".tr}: ${ordersModel.ordersPrice} \$ ",
              style: const TextStyle(fontFamily: "sans"),
            ),
            if (ordersModel.ordersPricedelivery == "0")
              Text(
                "${"141".tr}: ${ordersModel.ordersPricedelivery}  ",
                style: const TextStyle(fontFamily: "sans"),
              ),
            if (ordersModel.ordersPricedelivery != "0")
              Text(
                "${"141".tr}: ${ordersModel.ordersPricedelivery} \$ ",
                style: const TextStyle(fontFamily: "sans"),
              ),
            Text(
                "${"142".tr}: ${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)} "),
            Text(
                "${"143".tr}: ${controller.printOrderStatus(ordersModel.ordersStatus!)}  "),
            /* if (int.parse(ordersModel.ordersPrice!) + int.parse(ordersModel.ordersPricedelivery!) !=
                int.parse(ordersModel.ordersTotalprice!)) */
            /* if (("${ordersModel.ordersPrice!}" + "${ordersModel.ordersPricedelivery!}") ==
                "${ordersModel.ordersTotalprice!}") */

            Text(
                "${"144".tr}: ${controller.getCouponDisount(int.tryParse(ordersModel.ordersPrice!), int.tryParse(ordersModel.ordersPricedelivery!), int.tryParse(ordersModel.ordersTotalprice!))} "),
            const Divider(),
            Row(
              children: [
                Text(
                  "${"78".tr}:${ordersModel.ordersTotalprice} \$",
                  style: const TextStyle(
                      color: AppColor.secondColor, fontFamily: "sans"),
                ),
                const Spacer(),
                MaterialButton(
                  color: AppColor.thirdColor,
                  onPressed: () {
                    Get.toNamed(AppRotes.ordersDetails,
                        arguments: {"ordersmodel": ordersModel});
                  },
                  child: Text(
                    "135".tr,
                    style: const TextStyle(color: AppColor.secondColor),
                  ),
                ),
                const SizedBox(width: 10),
                if (ordersModel.ordersStatus == "0")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.deleteOrders(ordersModel.ordersId!);
                    },
                    child: Text(
                      "136".tr,
                      style: const TextStyle(color: AppColor.secondColor),
                    ),
                  ),
                if (ordersModel.ordersStatus == "3" &&
                    ordersModel.ordersType == "0")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      controller.goToPageTracking(ordersModel);
                    },
                    child: Text(
                      "137".tr,
                      style: const TextStyle(color: AppColor.secondColor),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
