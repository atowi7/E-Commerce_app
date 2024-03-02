class UserFavoriteModel {
  String? userId;
  String? proId;
  String? proName;
  String? proNameAr;
  String? proDescription;
  String? proDescriptionAr;
  String? proColor;
  String? proColorAr;
  String? proImage;
  String? proPrice;
  String? proRate;
  String? proRateNote;
  String? proDiscount;
  String? proPayment;
  String? proActive;
  String? proCount;
  String? proCreatedat;
  String? catId;
  String? priceAfterDiscount;
  String? favId;
  String? favUserid;
  String? favProid;

  UserFavoriteModel(
      {userId,
      proId,
      proName,
      proNameAr,
      proDescription,
      proDescriptionAr,
      proColor,
      proColorAr,
      proImage,
      proPrice,
      proRate,
      proRateNote,
      proDiscount,
      proPayment,
      proActive,
      proCount,
      proCreatedat,
      catId,
      priceAfterDiscount,
      favId,
      favUserid,
      favProid});

  UserFavoriteModel.fromJson(json) {
    userId = json['user_id'];
    proId = json['pro_id'];
    proName = json['pro_name'];
    proNameAr = json['pro_name_ar'];
    proDescription = json['pro_description'];
    proDescriptionAr = json['pro_description_ar'];
    proColor = json['pro_color'];
    proColorAr = json['pro_color_ar'];
    proImage = json['pro_image'];
    proPrice = json['pro_price'];
    proRate = json['pro_rate'];
    proRateNote = json['pro_ratenote'];
    proDiscount = json['pro_discount'];
    proPayment = json['pro_payment'];
    proActive = json['pro_active'];
    proCount = json['pro_count'];
    proCreatedat = json['pro_createdat'];
    catId = json['cat_id'];
    priceAfterDiscount = json['priceafterdiscount'];
    favId = json['fav_id'];
    favUserid = json['fav_userid'];
    favProid = json['fav_proid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['user_id'] = userId;
    data['pro_id'] = proId;
    data['pro_name'] = proName;
    data['pro_name_ar'] = proNameAr;
    data['pro_description'] = proDescription;
    data['pro_description_ar'] = proDescriptionAr;
    data['pro_image'] = proImage;
    data['pro_price'] = proPrice;
    data['pro_discount'] = proDiscount;
    data['pro_active'] = proActive;
    data['pro_count'] = proCount;
    data['pro_createdat'] = proCreatedat;
    data['cat_id'] = catId;
    data['fav_id'] = favId;
    data['fav_userid'] = favUserid;
    data['fav_proid'] = favProid;
    return data;
  }
}
