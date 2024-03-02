import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/getdecodepolyline.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/model/ordermodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseTrackingController extends GetxController {
  getCurrentPosition();
  getDestPosition();
  getPolyline();
  updateMarker(double newLat, double newLong);
}

class TrackingController extends BaseTrackingController {
  late StatusRequest statusRequest;

  late OrderModel orderModel;

  AppServices appServices = Get.find();

  bool? serviceEnabled;
  LocationPermission? permission;

  GoogleMapController? mapcontroller;
  // Completer<GoogleMapController> mapcontroller =
  //     Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;

  Set<Marker> markers = {};

  Set<Polyline> polylineSet = {};

  double? currentLat;
  double? currentLong;
  double? destLat;
  double? destLong;

  @override
  void onInit() {
    statusRequest = StatusRequest.success;
    orderModel = Get.arguments['orderModel'];

    currentLat = double.parse(orderModel.addressLat!);
    currentLong = double.parse(orderModel.addressLong!);

    print('dest $currentLat , $currentLong');

    kGooglePlex = CameraPosition(
      target: LatLng(currentLat!, currentLong!),
      zoom: 15,
    );

    //Future.delayed(Duration(seconds: 3));
    getCurrentPosition();
    getDestPosition();
    getPolyline();

    super.onInit();
  }

  @override
  getCurrentPosition() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (serviceEnabled == false) {
      Get.snackbar('39'.tr, '131'.tr, duration: const Duration(seconds: 2));
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('39'.tr, '132'.tr, duration: const Duration(seconds: 2));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('39'.tr, '133'.tr, duration: const Duration(seconds: 2));
    }

    if (mapcontroller != null) {
      mapcontroller!.animateCamera(
          CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));
    }

    markers.add(Marker(
        markerId: const MarkerId('current'),
        position: LatLng(currentLat!, currentLong!),
        infoWindow: const InfoWindow(title: 'Me'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));

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
        print('dest $destLat , $destLong');
      }

      updateMarker(destLat!, destLong!);
    });
  }

  @override
  getPolyline() async {
    await Future.delayed(const Duration(seconds: 5));
    polylineSet =
        await getDecodePolyline(currentLat!, currentLong!, destLat!, destLong!);
  }

  @override
  updateMarker(newLat, newLong) async {
    markers.removeWhere((element) => element.markerId.value == 'dest');
    markers.add(Marker(
        markerId: const MarkerId('dest'),
        position: LatLng(newLat, newLong),
        infoWindow: const InfoWindow(title: 'Delivery'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
        //  await BitmapDescriptor.fromAssetImage(
        //     const ImageConfiguration(devicePixelRatio: 2.5),
        //     ImageAssets.googleLogo),
        ));

    update();
  }

  @override
  void onClose() {
    mapcontroller!.dispose();
    super.onClose();
  }
}
