import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.notificationView, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String userid) async {
    var response = await crud.postData(AppLink.notificationDelete, {
      'id': id,
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
