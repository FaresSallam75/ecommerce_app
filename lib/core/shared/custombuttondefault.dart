import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonDefault extends StatelessWidget {
  final String text;
  final void Function()? onBressed;

  const CustomButtonDefault(
      {super.key, required this.text, required this.onBressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: MaterialButton(
        height: 40,
        minWidth: Get.width - 100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5),
        color: AppColor.secondColor,
        textColor: AppColor.backGround,
        onPressed: onBressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
