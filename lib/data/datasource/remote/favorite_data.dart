import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class FavoriteData {
  Crud crud;

  FavoriteData(this.crud);

  addFavorite(String userid, String proid) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      'userid': userid,
      'proid': proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteFavorite(String userid, String proid) async {
    var response = await crud.postData(AppLink.favoriteDelete, {
      'userid': userid,
      'proid': proid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
