import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

abstract class BaseFavoriteController extends GetxController {
  setFavorite(String proid, String isfav);
  addFavorite(String proid);
  deleteFavorite(String proid);
}

class FavoriteController extends BaseFavoriteController {
  String? userid;
  Map isFav = {};

  AppServices appServices = Get.find();

  FavoriteData favoritedata = FavoriteData(Get.find());

  @override
  void onInit() {
    userid = appServices.sharedPreferences.getString('user_id');
    super.onInit();
  }

  @override
  setFavorite(proid, isfav) {
    isFav[proid] = isFav;
    update();
  }

  @override
  addFavorite(proid) {
    favoritedata.addFavorite(userid!, proid);
  }

  @override
  deleteFavorite(String proid) {
    favoritedata.deleteFavorite(userid!, proid);
  }
}
