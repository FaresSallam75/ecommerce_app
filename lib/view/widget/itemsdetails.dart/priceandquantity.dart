import 'package:ecommerce_app2/controller/items/itemsdetails_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PriceAndQuantity extends GetView<ItemsDetailsControllerImp> {
  final String price;
  final String quantity;
  final String discount;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const PriceAndQuantity(
      {super.key,
      required this.price,
      required this.quantity,
      required this.discount,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: const Icon(Icons.add)),
            Container(
              padding: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: AppColor.black),
              ),
              child: Text(
                quantity,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black),
              ),
            ),
            IconButton(
              onPressed: onRemove,
              icon: const Icon(Icons.remove),
            ),
          ],
        ),
        const Spacer(),
        if (controller.itemsModel!.itemsDiscount != "0")
          Text(
            "${"70".tr}  $discount% ",
            // ignore: deprecated_member_use
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "sans"),
          ),
        const Spacer(),
        Text(
          "$price \$",
          style: const TextStyle(
              fontFamily: "ans",
              fontSize: 25,
              color: AppColor.secondColor,
              height: 1.5),
        ),
      ],
    );
  }
}
