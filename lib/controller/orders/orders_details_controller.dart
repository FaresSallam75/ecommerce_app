import 'dart:async';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/data/datasourse/remote/orders/details_orders.dart';
import 'package:ecommerce_app2/data/model/cartmodel.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completerController;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];

  DetailsOrdersData detailsOrdersData = DetailsOrdersData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;

  getCurrentLocation() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(
          double.parse(ordersModel.addressLatt!.toString()),
          double.parse(ordersModel.addressLatt!.toString()),
        ),
        zoom: 12.4746,
      );
      markers.add(
        Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
            double.parse(ordersModel.addressLatt!),
            double.parse(ordersModel.addressLatt!),
          ),
        ),
      );
    }
  }

  check(orderPrice, orderDelivery, totolPrice) {
    if ((orderPrice + orderDelivery) == totolPrice) {
      return "0";
    } else {
      return "10 %";
    }
  }

  getOrdersDetailsData() async {
    statusRequest = StatusRequest.loading;

    var response =
        await detailsOrdersData.detailsOrdersData(ordersModel.ordersId!);
    print("=============================== ==========================");
    print("=============================== Controller $response ");
    print("=============================== ==========================");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    ordersModel = Get.arguments['ordersmodel'];
    getCurrentLocation();
    getOrdersDetailsData();
    completerController = Completer<GoogleMapController>();
  }
}
