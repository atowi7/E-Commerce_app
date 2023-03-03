import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class CheckoutData {
  Crud crud;

  CheckoutData(this.crud);

  addOrder(
    String price,
    String deliveryprice,
    String coupon,
    String paymentmethod,
    String deliveryType,
    String addressid,
    String userid,
  ) async {
    var response = await crud.postData(AppLink.addressAdd, {
      'orders_price': price,
      'orders_deliveryprice': deliveryprice,
      'orders_coupon': coupon,
      'orders_paymentmethod': paymentmethod,
      'orders_type': deliveryType,
      'orders_addressid': addressid,
      'orders_userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
