import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardCheckoutDelivery extends StatelessWidget {
  final String title;
  final String image;
  final bool active;
  const CardCheckoutDelivery(
      {super.key,
      required this.title,
      required this.image,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        color: active ? AppColor.secondColor : null,
        border: Border.all(color: AppColor.secondColor, width: 1.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image,
              width: 60,
              color: active ? AppColor.backGround : AppColor.secondColor),
          Text(
            title,
            style: TextStyle(
                color: active ? AppColor.backGround : AppColor.secondColor,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
