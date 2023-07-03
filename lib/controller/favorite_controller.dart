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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('39'.tr, '110'.tr);
        update();
      } else {
        Get.snackbar('39'.tr, '111'.tr);
        // statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('94'.tr, '97'.tr);
    }
  }

  @override
  deleteFavorite(String proid) async {
    var response = await favoritedata.deleteFavorite(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('39'.tr, '112'.tr);
        update();
      } else {
        Get.snackbar('39'.tr, '113'.tr);
      }
    } else {
      Get.snackbar('94'.tr, '97'.tr);
    }
  }

  @override
  clear() {
    isFav.clear();
    update();
  }
}
