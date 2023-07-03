import 'dart:async';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseAddAddressController extends GetxController {
  getCurrentPos();
  addMarker(LatLng latLng);
  goToAddDetail();
}

class AddAddressController extends BaseAddAddressController {
  Completer<GoogleMapController> mapcontroller =
      Completer<GoogleMapController>();

  StatusRequest statusRequest = StatusRequest.loading;

  bool? serviceEnabled;
  LocationPermission? permission;

  Position? position;

  CameraPosition? kGooglePlex;

  Set<Marker> markers = {};

  double? lat;
  double? long;

  @override
  void onInit() {
    getCurrentPos();
    super.onInit();
  }

  @override
  getCurrentPos() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      Get.snackbar('39'.tr, '131'.tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('39'.tr, '132'.tr);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('39'.tr, '133'.tr);
    }
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.altitude, position!.longitude),
      zoom: 15,
    );

    addMarker(LatLng(position!.altitude, position!.longitude));

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addMarker(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('m'), position: latLng));

    lat = latLng.latitude;
    long = latLng.longitude;
    update();
  }

  @override
  goToAddDetail() {
    Get.offNamed(AppRoute.addressadddetail, arguments: {
      'lat': lat,
      'long': long,
    });
  }

  // CameraPosition kLake = const CameraPosition(
  //   bearing: 192.8334901395799,
  //   target: LatLng(37.43296265331129, -122.08832357078792),
  //   tilt: 59.440717697143555,
  //   zoom: 19.151926040649414);
}
