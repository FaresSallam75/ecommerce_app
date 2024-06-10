import 'package:ecommerce_app2/controller/address/viewaddress_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("113".tr),
        //centerTitle: true,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRotes.addressAdd);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.backGround,
        ),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(
                  addressModel: controller.data[index],
                  onPressedDelete: () {
                    controller.deleteAddress(controller.data[index].addressId!);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onPressedDelete;
  const CardAddress(
      {super.key, required this.addressModel, required this.onPressedDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          "${addressModel.addressName}",
          style: const TextStyle(fontSize: 20),
        ),
        subtitle:
            Text("${addressModel.addressCity} ${addressModel.addressStreet}"),
        trailing: IconButton(
            onPressed: onPressedDelete,
            icon: const Icon(Icons.delete_outline_outlined)),
      ),
    ));
  }
}
