class OrderModel {
  String? ordersId;
  String? ordersPrice;
  String? ordersDeliveryprice;
  String? ordersTotalprice;
  String? ordersCouponid;
  String? ordersCoupondiscount;
  String? ordersPaymentmethod;
  String? ordersType;
  String? ordersStatus;
  String? ordersCreatedat;
  String? ordersDeleted;
  String? ordersAddressid;
  String? ordersUserid;

  OrderModel({
    this.ordersId,
    this.ordersPrice,
    this.ordersDeliveryprice,
    this.ordersTotalprice,
    this.ordersCouponid,
    this.ordersCoupondiscount,
    this.ordersPaymentmethod,
    this.ordersType,
    this.ordersStatus,
    this.ordersCreatedat,
    this.ordersDeleted,
    this.ordersAddressid,
    this.ordersUserid,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersPrice = json['orders_price'];
    ordersDeliveryprice = json['orders_deliveryprice'];
    ordersTotalprice = json['orders_totalprice'];
    ordersCouponid = json['orders_couponid'];
    ordersCoupondiscount = json['orders_coupondiscount'];
    ordersPaymentmethod = json['orders_paymentmethod'];
    ordersType = json['orders_type'];
    ordersStatus = json['orders_status'];
    ordersCreatedat = json['orders_createdat'];
    ordersDeleted = json['orders_deleted'];
    ordersAddressid = json['orders_addressid'];
    ordersUserid = json['orders_userid'];
  }
}
