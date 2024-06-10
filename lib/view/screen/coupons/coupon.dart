import 'package:ecommerce_app2/controller/coupons/coupon_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPageView extends StatelessWidget {
  const CouponPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CouponsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("114".tr),
        // centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.secondColor,
          ),
        ),
      ),
      body: GetBuilder<CouponsController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                controller.listcouponData.length,
                (index) => Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: AppColor.thirdColor.withOpacity(0.8),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${"150".tr} : ${controller.listcouponData[index].couponId}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: AppColor.secondColor,
                                    fontSize: 22.0)),
                        Text(
                          "${"151".tr} :   ${controller.listcouponData[index].couponName}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: AppColor.secondColor, fontSize: 22.0),
                        ),
                        Text(
                            "${"152".tr} :${controller.listcouponData[index].couponCount}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: AppColor.secondColor,
                                    fontSize: 22.0)),
                        Text(
                            "${"134".tr} :${controller.listcouponData[index].couponDiscount} %",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    color: AppColor.secondColor,
                                    fontSize: 22.0)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 

 /* Container(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  isThreeLine: true,
                  title: Text(
                    "${controller.couponName}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  subtitle: Text("${controller.couponCount}",
                      style: Theme.of(context).textTheme.headlineLarge),
                  trailing: Text("${controller.discountCoupon}",
                      style: Theme.of(context).textTheme.headlineLarge),
                  leading: Text("${controller.couponID}",
                      style: Theme.of(context).textTheme.headlineLarge),
                ),
              ), */