import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/data/datasource/remote/search_data.dart';
import 'package:ecommerce_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseSearchController extends GetxController {
  onSearch();
  onChangeSearch(String val);
  getsearchData();
}

class MySearchController extends BaseSearchController {
  List<ProductModel> searchProducts = [];
  TextEditingController? searchTextController;
  bool isSearch = false;

  SearchData searchData = SearchData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  onSearch() {
    searchProducts.clear();
    getsearchData();
    isSearch = true;
    update();
  }

  @override
  onChangeSearch(val) {
    if (val == '') {
      isSearch = false;
    }
    update();
  }

  @override
  getsearchData() async {
    statusRequest = StatusRequest.loading;

    var response = await searchData.searchData(searchTextController!.text);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];

        searchProducts.addAll(data.map((e) => ProductModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    }
    update();
  }
}
