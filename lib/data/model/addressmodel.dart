class AddressModel {
  String? addressId;
  String? addressName;
  String? addressLat;
  String? addressLong;
  String? addressStreet;
  String? addressCity;
  String? addressUserid;

  AddressModel({
    this.addressId,
    this.addressName,
    this.addressLat,
    this.addressLong,
    this.addressStreet,
    this.addressCity,
    this.addressUserid,
  });

  AddressModel.fromJson(json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressStreet = json['address_street'];
    addressCity = json['address_city'];
    addressUserid = json['address_userid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['address_name'] = addressName;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_street'] = addressStreet;
    data['address_city'] = addressCity;
    data['address_userid'] = addressUserid;
    return data;
  }
}
