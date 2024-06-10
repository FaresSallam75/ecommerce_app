import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAppBar extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;
  final IconData iconData;
  final bool activeColor;
  const CustomButtonAppBar(
      {super.key,
      required this.onPressed,
      required this.textButton,
      required this.iconData,
      required this.activeColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: activeColor ? AppColor.secondColor : AppColor.greyDark,
          ),
          Text(
            textButton,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: activeColor ? AppColor.secondColor : AppColor.greyDark,
            ),
          ),
        ],
      ),
    );
  }
}
