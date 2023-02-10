import 'package:ecommerce_app/controller/test_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TestView extends StatelessWidget {
  const TestView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('test')),
      body: GetBuilder<TestConroller>(
        init: TestConroller(),
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) => Center(
                child: Text('${controller.data}'),
              ),
            )),
      ),
    );
  }
}
