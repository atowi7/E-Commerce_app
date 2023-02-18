import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class BaseFavoriteController extends GetxController {
  setFavorite(String proid, String isfav);
  addFavorite(String proid);
  deleteFavorite(String proid);
}

class FavoriteController extends BaseFavoriteController {
  // String? userid;
  Map isFav = {};

  AppServices appServices = Get.find();

  FavoriteData favoritedata = FavoriteData(Get.find());

  late StatusRequest statusRequest;

  @override
  setFavorite(proid, isfav) {
    isFav[proid] = isFav;
    update();
  }

  @override
  addFavorite(proid) async {
    statusRequest = StatusRequest.loading;

    var response = await favoritedata.addFavorite(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('NOTFY', 'add to fav sucess');
      } else {
        Get.snackbar('NOTFY', 'add to fav Fail');
        statusRequest = StatusRequest.noDatafailure;
      }
    }
  }

  @override
  deleteFavorite(String proid) async {
    statusRequest = StatusRequest.loading;

    var response = await favoritedata.deleteFavorite(
        appServices.sharedPreferences.getString('userid')!, proid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('NOTFY', 'delete from fav sucess');
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
  }
}
