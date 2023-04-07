import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersView, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String orderid) async {
    var response = await crud.postData(AppLink.ordersDelete, {
      'orderid': orderid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
