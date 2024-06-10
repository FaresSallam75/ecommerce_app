

import 'dart:convert';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getPolyline(lat, long, detinationLat, detinationLong) async {
  Set<Polyline> ploylineSet = {};
  List<LatLng> polylineCordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleMapKey = "AIzaSyAOVcVg_1EZSgNITnwTunuiYhvI88ybBW8";

  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$detinationLat,$detinationLong&key=$googleMapKey";

 
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print("responseBody success ===================== $responseBody =========");

  var point = responseBody['routes'][0]['overview_polyline']['points'];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);

  if (result.isNotEmpty) {
     print("result is Not empty =========================");
    result.forEach((PointLatLng pointLatLng) {
      polylineCordinates
          .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  } else {
    print("result is empty =========================");
  }

  Polyline polyline = Polyline(
      polylineId: const PolylineId("poly"),
      color: AppColor.secondColor,
      width: 5, 
      points: polylineCordinates);

  ploylineSet.add(polyline);

  return ploylineSet;
}
