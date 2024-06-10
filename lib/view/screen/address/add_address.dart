import 'package:ecommerce_app2/controller/address/add_controller.dart';
import 'package:ecommerce_app2/core/class/handlingdataview.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/core/shared/custombuttondefault.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController addAddressController = Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("123".tr),
        //centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColor.secondColor,
            )),
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: CustomButtonDefault(
          text: "124".tr,
          onBressed: () {
            addAddressController.goToPageAddAddressDeatils();
          },
        ),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (addAddressController) => HandlingDataView(
            statusRequest: addAddressController.statusRequest,
            widget: Column(
              children: [
                if (addAddressController.kGooglePlex != null)
                  Expanded(
                    child: GoogleMap(
                      markers: addAddressController.markers.toSet(),
                      onTap: (latLng) {
                        addAddressController.addMarkers(latLng);
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: addAddressController.kGooglePlex!,
                      onMapCreated: (GoogleMapController controllerMap) {
                        addAddressController.CompleterController!
                            .complete(controllerMap);
                      },
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
