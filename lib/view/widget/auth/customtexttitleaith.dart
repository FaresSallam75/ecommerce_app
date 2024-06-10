import 'package:flutter/material.dart';

class CustomTextTitlleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitlleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
