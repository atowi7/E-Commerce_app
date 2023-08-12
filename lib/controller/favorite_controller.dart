import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class BaseFavoriteController extends GetxController {
  setFavorite(String proid, String active);
  addFavorite(String proid);
  deleteFavorite(String proid);
  clear();
}

class FavoriteController extends BaseFavoriteController {
  // String? userid;
  Map isFav = {};

  AppServices appServices = Get.find();

  FavoriteData favoritedata = FavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  setFavorite(proid, active) {
    isFav[proid] = active;
  }

  @override
  addFavorite(proid) async {
    var response = await favoritedata.addFavorite(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '110'.tr,duration:const Duration(seconds: 2));
        update();
      } else {
        Get.snackbar('39'.tr, '111'.tr,duration:const Duration(seconds: 2));
        // statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.snackbar('94'.tr, '97'.tr,duration:const Duration(seconds: 2));
    }
  }

  @override
  deleteFavorite(String proid) async {
    var response = await favoritedata.deleteFavorite(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('39'.tr, '112'.tr,duration:const Duration(seconds: 2));
        update();
      } else {
        Get.snackbar('39'.tr, '113'.tr,duration:const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('94'.tr, '97'.tr,duration:const Duration(seconds: 2));
    }
  }

  @override
  clear() {
    isFav.clear();
    update();
  }
}
