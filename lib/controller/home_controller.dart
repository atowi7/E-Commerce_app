import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class BaseHomeController extends GetxController {
  getData();
  goToItem(List categories, String cid);
}

class HomeController extends BaseHomeController {
  String? id;
  String? name;
  AppServices appServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  List categories = [];
  List items = [];

  late StatusRequest statusRequest;
  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  void onInit() {
    id = appServices.sharedPreferences.getString('userid');
    name = appServices.sharedPreferences.getString('username');
    getData();
    super.onInit();
  }

  @override
  goToItem(categories, cid) {
    Get.toNamed(AppRoute.product, arguments: {
      'categories': categories,
      'cid': cid,
    });
  }
}
