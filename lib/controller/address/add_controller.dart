import 'dart:async';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressController extends GetxController {
  // ignore: non_constant_identifier_names
  Completer<GoogleMapController>? CompleterController;
  Position? position;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? latt;
  double? long;
  StatusRequest statusRequest = StatusRequest.loading;

  addMarkers(LatLng latLng) {
    markers.clear();
    markers.add(
      Marker(markerId: const MarkerId("1"), position: latLng),
    );
    latt = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(LatLng(position!.latitude, position!.longitude));
    statusRequest = StatusRequest.none;
    update();
  }

  goToPageAddAddressDeatils() {
    Get.toNamed(AppRotes.addressAddDetails,
        arguments: {"latt": latt, "long": long});
  }

  @override
  void onInit() {
    super.onInit();
    getCurrentPosition();
    CompleterController = Completer<GoogleMapController>();
  }
}
