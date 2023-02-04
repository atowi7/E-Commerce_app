import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class SignupVerificationData {
  Crud curd;
  SignupVerificationData(this.curd);

  postData(String email, String verifyCode) async {
    var response = await curd.postData(AppLink.verifyCode, {
      'email': email,
      'verifycode': verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
