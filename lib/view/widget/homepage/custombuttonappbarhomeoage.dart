import 'package:ecommerce_app2/controller/homepage/homepagescreen_controller.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/widget/homepage/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAppBarHomePage extends StatelessWidget {
  const CustomButtonAppBarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        padding: const EdgeInsets.only(right: 0.0),
        //height: 70.0,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12.0,
        clipBehavior: Clip.none,
        surfaceTintColor: AppColor.secondColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...List.generate(
              controller.listPage.length + 1,
              (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer()
                    : CustomButtonAppBar(
                        textButton: controller.buttonAppBar[i]['title'],
                        iconData: controller.buttonAppBar[i]['icon'],
                        onPressed: () {
                          controller.changePage(i);
                        },
                        activeColor: controller.currentPage == i ? true : false,
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
