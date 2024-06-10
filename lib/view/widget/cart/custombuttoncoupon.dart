import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomeButtonCoupon extends StatelessWidget {
  final String textButton;
  final Function()? onBressed;
  const CustomeButtonCoupon(
      {super.key, required this.textButton, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
        color: AppColor.secondColor,
        textColor: Colors.white,
        onPressed: onBressed,
        child: Text(
          textButton,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
