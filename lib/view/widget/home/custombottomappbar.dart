import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/view/widget/home/custombotton_bottomappbar.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      builder: (controller) {
        return BottomAppBar(
                height: 70,
                shape: const CircularNotchedRectangle(),
                notchMargin: 20,
                child: Row(
                  children: List.generate(controller.pages.length+1, (index) {
                    int i =index >2 ? index-1:index;
                    return index==2?const Spacer(): CustomBottonBottomAppBar(
                      title: controller.pagetitle[i],
                      icon: controller.pageicon[i],
                      active: controller.currentPage == i ? true : false,
                      onPressed: () => controller.changePage(i),
                    );
                  }),
                ));
      }
    );
  }
}