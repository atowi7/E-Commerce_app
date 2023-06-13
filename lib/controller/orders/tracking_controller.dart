import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseTrackingController extends GetxController {
  getCurrentPosition();
  getDestPosition();
  updateMarker(double newLat, double newLong);
}

class TrackingController extends BaseTrackingController {
  late StatusRequest statusRequest;

  late OrderModel orderModel;

  AppServices appServices = Get.find();

  bool? serviceEnabled;
  LocationPermission? permission;

  late GoogleMapController mapcontroller;
  // Completer<GoogleMapController> mapcontroller =
  //     Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;

  Set<Marker> markers = {};

  // Set<Polyline> polylineSet = {};

  double? currentLat;
  double? currentLong;
  double? destLat;
  double? destLong;

  @override
  void onInit() {
    statusRequest = StatusRequest.sucess;
    orderModel = Get.arguments['orderModel'];

    currentLat = double.parse(orderModel.addressLat!);
    currentLong = double.parse(orderModel.addressLong!);

    kGooglePlex = CameraPosition(
      target: LatLng(currentLat!, currentLong!),
      zoom: 15,
    );

    //Future.delayed(Duration(seconds: 3));
    getCurrentPosition();
    getDestPosition();

    super.onInit();
  }

  @override
  getCurrentPosition() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      Get.snackbar('NOTFY', 'Please enable the location');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('NOTFY', 'Please enable the location to use the map');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('NOTFY', 'You can not use the map without your location');
    }

    mapcontroller.animateCamera(
        CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));

    markers.add(Marker(
        markerId: const MarkerId('current'),
        position: LatLng(currentLat!, currentLong!)));

    update();
  }

  @override
  getDestPosition() {
    FirebaseFirestore.instance
        .collection('delivery')
        .doc(orderModel.ordersId)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destLat = event['lat'];
        destLong = event['long'];
      }

      updateMarker(destLat!, destLong!);
    });
  }

  @override
  updateMarker(newLat, newLong) {
    markers.removeWhere((element) => element.markerId.value == 'dest');
    markers.add(Marker(
        markerId: const MarkerId('dest'), position: LatLng(newLat, newLong)));

    update();
  }

  @override
  void onClose() {
    mapcontroller.dispose();
    super.onClose();
  }
}
