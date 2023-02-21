import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addCart(String userid, String proid) async {
    var response = await crud.postData(AppLink.cartAdd, {
      'userid': userid,
      'proid': proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String userid, String proid) async {
    var response = await crud.postData(AppLink.cartDelete, {
      'userid': userid,
      'proid': proid,
    });
    return response.fold((l) => l, (r) => r);
  }

  getCount(String userid, String proid) async {
    var response = await crud.postData(AppLink.getcount, {
      'userid': userid,
      'proid': proid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
