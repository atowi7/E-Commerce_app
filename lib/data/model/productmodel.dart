class ProductModel {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? color;
  String? image;
  String? price;
  String? shipping;
  String? delivery;
  String? rate;
  String? ratenote;
  String? discount;
  String? active;
  String? count;
  String? createdat;
  String? categorieId;
  String? adminId;
  String? priceafterdiscount;
  String? shippingPrice;
  String? deliveryPrice;

  String? cId;
  String? cName;
  String? cNameAr;
  String? cImage;
  String? cCreatedat;
  String? favorite;

  ProductModel({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.image,
    this.price,
    this.shipping,
    this.delivery,
    this.rate,
    this.ratenote,
    this.discount,
    this.active,
    this.count,
    this.createdat,
    this.categorieId,
    this.adminId,
    this.priceafterdiscount,
    this.shippingPrice,
    this.deliveryPrice,
    this.cId,
    this.cName,
    this.cNameAr,
    this.cImage,
    this.cCreatedat,
    this.favorite,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['pro_id'];
    name = json['pro_name'];
    nameAr = json['pro_name_ar'];
    description = json['pro_desc'];
    descriptionAr = json['pro_desc_ar'];
    color = json['pro_color'];
    image = json['pro_image'];
    price = json['pro_price'];
    shipping = json['pro_shipping'];
    delivery = json['pro_delivery'];
    rate = json['pro_rate'];
    ratenote = json['pro_ratenote'];
    discount = json['pro_discount'];
    active = json['pro_active'];
    count = json['pro_count'];
    createdat = json['pro_createdat'];
    categorieId = json['pro_catid'];
    adminId = json['pro_adminid'];
    priceafterdiscount = json['priceafterdiscount'];
    shippingPrice = json['shippingprice'];
    deliveryPrice = json['deliveryprice'];
    cId = json['categorie_id'];
    cName = json['categorie_name'];
    cNameAr = json['categorie_name_ar'];
    cImage = json['categorie_image'];
    cCreatedat = json['categorie_createdat'];
    favorite = json['favorite'];
  }
}
