import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handle_data.dart';
import 'package:ecommerce_app/core/service/services.dart';
import 'package:ecommerce_app/data/datasource/remote/userfavorite_data.dart';
import 'package:ecommerce_app/data/model/userfavoritemodel.dart';
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
    update();

    var response = await userfavoritedata
        .getData(appServices.sharedPreferences.getString('userid')!);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        datalist.clear();
        datalist.addAll(data.map((e) => UserFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDataFailure;
      }
    } else {
      Get.defaultDialog(title: '94'.tr, middleText: '97'.tr);
    }

    update();
  }

  @override
  deletData(favid) {
    userfavoritedata.deleteData(favid);
    datalist.removeWhere((element) => element.favId == favid);
    Get.snackbar('39'.tr, '123'.tr,duration:const Duration(seconds: 2));

    update();
  }
}
