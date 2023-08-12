class ProductModel {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? color;
  String? image;
  String? price;
  String? rate;
  String? ratenote;
  String? discount;
  String? active;
  String? count;
  String? createdat;
  String? categorieId;
  String? cId;
  String? cName;
  String? cNameAr;
  String? cImage;
  String? cCreatedat;
  String? favorite;
  String? priceafterdiscount;
  ProductModel({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.image,
    this.price,
    this.rate,
    this.ratenote,
    this.discount,
    this.active,
    this.count,
    this.createdat,
    this.categorieId,
    this.cId,
    this.cName,
    this.cNameAr,
    this.cImage,
    this.cCreatedat,
    this.favorite,
    this.priceafterdiscount,
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
    rate = json['pro_rate'];
    ratenote = json['pro_ratenote'];
    discount = json['pro_discount'];
    active = json['pro_active'];
    count = json['pro_count'];
    createdat = json['pro_createdat'];
    categorieId = json['pro_categorie_id'];
    cId = json['c_id'];
    cName = json['c_name'];
    cNameAr = json['c_name_ar'];
    cImage = json['c_image'];
    cCreatedat = json['c_createdat'];
    favorite = json['favorite'];
    priceafterdiscount = json['priceafterdiscount'];
  }
}
