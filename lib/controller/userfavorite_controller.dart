import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/userfavorite_data.dart';
import 'package:ecommerce_app/data/model/userfavorite.dart';
import 'package:get/get.dart';

abstract class BaseUserFavoriteController extends GetxController {
  getData();
  deletData(String favid);
}

class UserFavoriteController extends BaseUserFavoriteController {
  List<UserFavoriteModel> datalist = [];
  AppServices appServices = Get.find();

  UserFavoriteData userfavoritedata = UserFavoriteData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await userfavoritedata
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        datalist.addAll(data.map((e) => UserFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    }
    update();
  }

  @override
  deletData(favid) {
    userfavoritedata.deleteData(favid);
    datalist.removeWhere((element) => element.favId == favid);
    Get.snackbar('WARRNING', 'YOUR FAVORITE PRODUCT IS DELETED');
    update();
  }
}
