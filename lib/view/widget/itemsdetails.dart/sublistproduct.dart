import 'package:ecommerce_app2/controller/items/itemsdetails_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SublistProducts extends GetView<ItemsDetailsControllerImp> {
  const SublistProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          controller.subItems.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 5),
            height: 60,
            width: 100,
            decoration: BoxDecoration(
              color: controller.subItems[index]["active"] == "1"
                  ? AppColor.blueDark
                  : AppColor.backGround,
              border: Border.all(width: 3, color: AppColor.blueDark),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              controller.subItems[index]["name"],
              style: TextStyle(
                  color: controller.subItems[index]["active"] == "1"
                      ? AppColor.backGround
                      : AppColor.blueDark,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
