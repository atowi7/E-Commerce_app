import 'package:ecommerce_app/controller/chat_controller.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: Theme.of(context).textTheme.displayLarge),
      ),
      body: GetBuilder<ChatController>(builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: null,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.displayMedium,
                labelStyle: Theme.of(context).textTheme.displayMedium,
                hintText: '166'.tr,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                focusColor: AppColor.primaryColor,
              ),
              // validator: (val) {
              //   return inputValidation('', val!, 2, 100);
              // },
            ),
            // ListView(
            //   padding: const EdgeInsets.all(8),
            //   children: [
            //     Form(
            //       key: null,
            //       child: Column(
            //         children: [
            //           TextFormField(
            //             controller: null,
            //             decoration: InputDecoration(
            //               hintStyle: Theme.of(context).textTheme.displayMedium,
            //               labelStyle: Theme.of(context).textTheme.displayMedium,
            //               hintText: '166'.tr,
            //               border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(25)),
            //               focusColor: AppColor.primaryColor,
            //             ),
            //             // validator: (val) {
            //             //   return inputValidation('', val!, 2, 100);
            //             // },
            //           ),
            //           MaterialButton(
            //               onPressed: () {},
            //               color: AppColor.primaryColor,
            //               splashColor: AppColor.secondaryColor,
            //               shape: const RoundedRectangleBorder(),
            //               child: const Icon(
            //                 Icons.send_rounded,
            //                 color: AppColor.primaryColor,
            //               )),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
          ],
        );
      }),
    );
  }
}
