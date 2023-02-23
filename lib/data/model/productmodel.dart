class ProductModel {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  String? price;
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
  ProductModel(
      {this.id,
      this.name,
      this.nameAr,
      this.description,
      this.descriptionAr,
      this.image,
      this.price,
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
      this.favorite});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['pro_id'];
    name = json['pro_name'];
    nameAr = json['pro_name_ar'];
    description = json['pro_description'];
    descriptionAr = json['pro_description_ar'];
    image = json['pro_image'];
    price = json['pro_price'];
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
  }
}
