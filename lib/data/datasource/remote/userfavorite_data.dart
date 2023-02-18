import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class UserFavoriteData {
  Crud crud;

  UserFavoriteData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.userfavorite, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
