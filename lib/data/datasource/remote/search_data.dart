import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class SearchData {
  Crud crud;

  SearchData(this.crud);
  searchData(String word) async {
    var response = await crud.postData(AppLink.productSearch, {
      'word': word,
    });
    return response.fold((l) => l, (r) => r);
  }
}
