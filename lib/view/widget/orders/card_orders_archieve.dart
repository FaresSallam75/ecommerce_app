import 'package:ecommerce_app2/controller/orders/archieve_orders_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:ecommerce_app2/view/widget/orders/dialog_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersArchieve extends GetView<ArchieveOrdersController> {
  final OrdersModel ordersModel;
  const CardOrdersArchieve({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    /*   String dateStringFromDatabase = ordersModel.ordersDatetime!;
    DateTime dateFromDatabase = DateTime.parse(dateStringFromDatabase);
    DateTime twentyFourHoursAgo =
        dateFromDatabase.subtract(Duration(hours: 24));
    var formatter = DateFormat('منذ يومان', 'ar');
    String formattedDate = formatter.format(twentyFourHoursAgo); */

    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "${"138".tr} :${ordersModel.ordersId}",
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
                "${"139".tr} :${controller.printOrderType(ordersModel.ordersType!)} "),
            Text(
              "${"140".tr} :${ordersModel.ordersPrice} \$ ",
              style: const TextStyle(fontFamily: "sans"),
            ),
            Text(
              "${"141".tr} :${ordersModel.ordersPricedelivery} \$ ",
              style: const TextStyle(fontFamily: "sans"),
            ),
            Text(
                "${"142".tr} :${controller.printPaymentMethod(ordersModel.ordersPaymentmethod!)} "),
            Text(
                "${"143".tr} :${controller.printOrderStatus(ordersModel.ordersStatus!)}  "),
            Text(
                "${"134".tr} :${controller.getCouponDisount(int.tryParse(ordersModel.ordersPrice!), int.tryParse(ordersModel.ordersPricedelivery!), int.tryParse(ordersModel.ordersTotalprice!))} "),
            const Divider(),
            if (ordersModel.ordersRating!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    int.parse(ordersModel.ordersRating!),
                    (index) => Icon(
                      Icons.star,
                      color: Colors.yellow.shade800,
                    ),
                  ),
                ],
              ),
            Row(
              children: [
                Text(
                  "${"78".tr} :${ordersModel.ordersTotalprice} \$",
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
                if (ordersModel.ordersRating == "0")
                  MaterialButton(
                    color: AppColor.thirdColor,
                    onPressed: () {
                      showDialogRating(context, ordersModel.ordersId!);
                    },
                    child: Text(
                      "153".tr,
                      style: const TextStyle(color: AppColor.secondColor),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
