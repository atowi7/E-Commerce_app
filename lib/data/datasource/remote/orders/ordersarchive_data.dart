import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersArchive, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
