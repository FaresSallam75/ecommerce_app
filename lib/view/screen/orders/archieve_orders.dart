import 'package:ecommerce_app2/controller/orders/archieve_orders_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/view/widget/orders/card_orders_archieve.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArchievedOrders extends StatelessWidget {
  const ArchievedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchieveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("122".tr),
        centerTitle: true,
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
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<ArchieveOrdersController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) =>
                  CardOrdersArchieve(ordersModel: controller.data[index]),
            ),
          ),
        ),
      ),
    );
  }
}
