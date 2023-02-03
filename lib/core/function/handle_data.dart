import 'package:ecommerce_app/core/class/Statusrequest.dart';

handleData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.sucess;
  }
}
