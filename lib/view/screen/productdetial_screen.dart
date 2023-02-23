import 'package:ecommerce_app/controller/productdetail_controller.dart';
import 'package:ecommerce_app/core/class/handlingdataview.dart';
import 'package:ecommerce_app/core/constant/color.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/langtranslate_database.dart';
import 'package:ecommerce_app/view/widget/customappbar.dart';
import 'package:ecommerce_app/view/widget/productdetail/Image_section.dart';
import 'package:ecommerce_app/view/widget/productdetail/amountandprice_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailController());
    return Scaffold(
      body: GetBuilder<ProductDetailController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              CustomAppbar(
                searchHint: 'Find ...',
                controller: TextEditingController(),
                onChanged: null,
                searchonPressed: () {},
                notifyPressed: () {},
                favPressed: () {},
              ),
              const ImageSection(),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${langTranslateDataBase(controller.productModel.nameAr!, controller.productModel.name!)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              AmountAndPriceSection(
                price: controller.productModel.price!,
                onPressedAdd: () {
                  controller.addCount();
                },
                count: controller.count,
                onPressedDelete: () {
                  controller.deleteCount();
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${langTranslateDataBase(controller.productModel.descriptionAr!, controller.productModel.description!)}',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Color',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.itemf.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                          color: controller.itemf[index]['active'] == 1
                              ? AppColor.blue
                              : null,
                          border: Border.all(color: AppColor.blue),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        controller.itemf[index]['name'],
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  )),
            ],
          ),
        );
      }),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.blue,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child: const Text('Go to cart'),
        ),
      ),
    );
  }
}
