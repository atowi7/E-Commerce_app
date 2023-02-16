import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class ProductData {
  Crud crud;

  ProductData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.product, {});
    return response.fold((l) => l, (r) => r);
  }
}
