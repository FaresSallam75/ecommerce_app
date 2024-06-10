import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardCheckoutPaymentMethod extends StatelessWidget {
  final String title;
  final bool active;
  const CardCheckoutPaymentMethod(
      {super.key, required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: active ? AppColor.secondColor : AppColor.thirdColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 17,
            color: active ? AppColor.backGround : AppColor.secondColor,
            height: 1),
      ),
    );
  }
}
