import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CardShippingAddressCheckout extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  final bool active;
  const CardShippingAddressCheckout(
      {super.key,
      required this.titleOne,
      required this.titleTwo,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: active ? AppColor.secondColor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          titleOne,
          style: TextStyle(
              color: active ? AppColor.backGround : AppColor.secondColor,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(titleTwo,
            style: TextStyle(
                color: active ? AppColor.backGround : AppColor.secondColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
