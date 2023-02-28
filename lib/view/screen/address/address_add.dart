import 'package:ecommerce_app/controller/address/addaddress_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/imageassets.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: GetBuilder<AddAddressController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: controller.kGooglePlex == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      ImageAssets.loading,
                    ),
                    const Text('Wait for map'),
                  ],
                )
              : Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController mapcontroller) {
                        controller.mapcontroller.complete(mapcontroller);
                      },
                      markers: controller.markers,
                      onTap: (latlang) {
                        controller.addMarker(latlang);
                      },
                    ),
                    Positioned(
                      bottom: 10,
                      right: Get.width / 2 - 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.blue,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                            onPressed: () {
                              controller.goToAddDetail();
                            },
                            icon: const Icon(Icons.arrow_right)),
                      ),
                    )
                  ],
                ),
        );
      }),
    );
  }
}
