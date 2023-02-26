import 'package:ecommerce_app/controller/auth/address/viewaddress_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/data/model/Addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address Detail'),
      ),
      body: GetBuilder<ViewAddressController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) => AddressWidget(
                    addressModel: controller.dataList[index],
                    onDelete: () {
                      controller
                          .deleteAddress(controller.dataList[index].addressId!);
                    },
                  )),
        );
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.blue,
          onPressed: () {
            controller.goToAddAddress();
          },
          child: const Icon(Icons.add)),
    );
  }
}

class AddressWidget extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const AddressWidget(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${addressModel.addressName}'),
      subtitle:
          Text('${addressModel.addressCity}+/ ${addressModel.addressStreet}'),
      trailing: IconButton(
        onPressed: onDelete,
        icon: const Icon(Icons.delete_forever_rounded),
      ),
    );
  }
}
