import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class OrderData {
  Crud crud;

  OrderData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.viewOrders, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
