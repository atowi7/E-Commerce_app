import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class MessageData {
  Crud crud;
  MessageData(this.crud);

  sendMessage(String message, String adminId, String userId) async {
    var response = await crud.postData(AppLink.messageAdd, {
      // 'proid': proId,
      'msg': message,
      'adminid': adminId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
