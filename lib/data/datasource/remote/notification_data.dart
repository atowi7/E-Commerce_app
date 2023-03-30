import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.notification, {
      'userid':userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
