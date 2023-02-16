import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class ProductData {
  Crud crud;

  ProductData(this.crud);

  getData(String cid) async {
    var response = await crud.postData(AppLink.product, {
      'cid':cid
    });
    return response.fold((l) => l, (r) => r);
  }
}
