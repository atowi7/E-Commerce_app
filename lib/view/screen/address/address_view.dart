import 'package:ecommerce_app/controller/address/viewaddress_controller.dart';
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
        title: Text('49'.tr),
      ),
      body: GetBuilder<ViewAddressController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) => AddressWidget(
                    addressModel: controller.dataList[index],
                    onEdit: () {
                      controller.goToEditAddress(
                        controller.dataList[index].addressId!,
                        controller.dataList[index].addressName!,
                        controller.dataList[index].addressStreet!,
                        controller.dataList[index].addressCity!,
                      );
                    },
                    onDelete: () {
                      Get.defaultDialog(
                        title: '39'.tr,
                        titleStyle: Theme.of(context).textTheme.displayMedium,
                        middleText: '40'.tr,
                        middleTextStyle:
                            Theme.of(context).textTheme.displaySmall,
                        onConfirm: () {
                          controller.deleteAddress(
                              controller.dataList[index].addressId!);
                        },
                        confirmTextColor: AppColor.blue,
                        cancelTextColor: AppColor.blue,
                        buttonColor: AppColor.white,
                        onCancel: () {
                          Get.back();
                        },
                      );
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
  final void Function()? onEdit;
  final void Function()? onDelete;
  const AddressWidget(
      {super.key,
      required this.addressModel,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${addressModel.addressName}'),
      subtitle:
          Text('${addressModel.addressCity}+/ ${addressModel.addressStreet}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: onEdit,
            icon: const Icon(Icons.edit_rounded),
          ),
          IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_forever_rounded),
          ),
        ],
      ),
    );
  }
}
