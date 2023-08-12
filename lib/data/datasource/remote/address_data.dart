import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/constant/applink.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.addressview, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  addAddress(String name, String lat, String long, String street, String city,
      String userid) async {
    var response = await crud.postData(AppLink.addressAdd, {
      'name': name,
      'lat': lat,
      'long': long,
      'street': street,
      'city': city,
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(String addressid, String name, String street, String city,
      String userid) async {
    var response = await crud.postData(AppLink.addressEdit, {
      'id': addressid,
      'name': name,
      'street': street,
      'city': city,
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(String addressid) async {
    var response = await crud.postData(AppLink.addressDelete, {
      'id': addressid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
