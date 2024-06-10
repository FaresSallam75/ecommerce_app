import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/function/get_decode_polyline.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TracingLocationController extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;
  GoogleMapController? completer;
  CameraPosition? cameraPosition;
  List<Marker> markers = [];
  Set<Polyline> ploylineSet = {};
  MyServices myServices = Get.find();

  double? detinationLat;
  double? detinationLong;
  double? currentLat;
  double? currentLong;

  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(
        double.parse(ordersModel.addressLatt!),
        double.parse(ordersModel.addressLong!),
      ),
      zoom: 12.4746,
    );

    markers.add(
      Marker(
        markerId: const MarkerId("current"),
        position: LatLng(
          double.parse(ordersModel.addressLatt!),
          double.parse(ordersModel.addressLong!),
        ),
      ),
    );
    print("addreslat ========== ${ordersModel.addressLatt!}");
    print("addreslong ========== ${ordersModel.addressLong!}");
    update();
  }

  intialPolyline() async {
    detinationLat = double.parse(ordersModel.addressLatt!);
    detinationLong = double.parse(ordersModel.addressLong!);
    await Future.delayed(const Duration(seconds: 1));
    ploylineSet = await getPolyline(
        currentLat, currentLong, detinationLat, detinationLong);
    update();
  }

  getLocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId)
        .snapshots()
        .listen(( DocumentSnapshot<Map<String, dynamic>> event) {
      if (event.exists) {
        print("event exist ??????????????????");
        detinationLat = event.get("lat");
        detinationLong = event.get("long");
        updateMarkerDelivery(detinationLat!, detinationLat!);
        
        print("detinationLat ==================== $detinationLat");
        print("detinationLong ==================== $detinationLong");
      } 
    });
    update();
  }

  updateMarkerDelivery(double newLat, double newLong) {
    markers.removeWhere((element) => element.markerId.value == "destination");
    markers.add(
      Marker(
        markerId: const MarkerId("destination"),
        position: LatLng(
          newLat,
          newLong,
        ),
      ),
    );
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getLocationDelivery();
    // intialPolyline();
    super.onInit();
  }

  @override
  void onClose() {
    completer!.dispose();
    super.onClose();
  }
}
