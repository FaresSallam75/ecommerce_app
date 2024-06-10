import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomeButtonCart extends StatelessWidget {
  final String textButton;
  final Function()? onBressed;
  const CustomeButtonCart(
      {super.key, required this.textButton, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        height: 40,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: AppColor.secondColor,
        textColor: Colors.white,
        onPressed: onBressed,
        child: Text(
          textButton,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
