import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class ProductData {
  Crud crud;

  ProductData(this.crud);

  getData(String userId, String cId) async {
    var response = await crud
        .postData(AppLink.productView, {'userid': userId, 'cid': cId});
    return response.fold((l) => l, (r) => r);
  }

  ratingPermission(String userId, String proId) async {
    var response = await crud.postData(
        AppLink.productRatingPermission, {'userid': userId, 'proid': proId});
    return response.fold((l) => l, (r) => r);
  }

  sendRating(String value, String comment, String proId, String userId) async {
    var response = await crud.postData(AppLink.productrate, {
      'value': value,
      'comment': comment,
      'proid': proId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
