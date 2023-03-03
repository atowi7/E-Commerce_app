class CouponModel {
  String? couponId;
  String? couponName;
  String? couponDiscount;
  String? couponCount;
  String? couponExpirydate;

  CouponModel(
      {this.couponId,
      this.couponName,
      this.couponDiscount,
      this.couponCount,
      this.couponExpirydate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscount = json['coupon_discount'];
    couponCount = json['coupon_count'];
    couponExpirydate = json['coupon_expirydate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['coupon_id'] = couponId;
    data['coupon_name'] = couponName;
    data['coupon_discount'] = couponDiscount;
    data['coupon_count'] = couponCount;
    data['coupon_expirydate'] = couponExpirydate;
    return data;
  }
}
