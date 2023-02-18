class ProductModel {
  String? id;
  String? name;
  String? name_ar;
  String? description;
  String? description_ar;
  String? image;
  String? price;
  String? discount;
  String? active;
  String? count;
  String? createdat;
  String? categorie_id;
  String? c_id;
  String? c_name;
  String? c_name_ar;
  String? c_image;
  String? c_createdat;
  String? favorite;
  ProductModel(
      this.id,
      this.name,
      this.name_ar,
      this.description,
      this.description_ar,
      this.image,
      this.price,
      this.discount,
      this.active,
      this.count,
      this.createdat,
      this.categorie_id,
      this.c_id,
      this.c_name,
      this.c_name_ar,
      this.c_image,
      this.c_createdat,
      this.favorite);
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['pro_id'];
    name = json['pro_name'];
    name_ar = json['pro_name_ar'];
    description = json['pro_description'];
    description_ar = json['pro_description_ar'];
    image = json['pro_image'];
    price = json['pro_price'];
    discount = json['pro_discount'];
    active = json['pro_active'];
    count = json['pro_count'];
    createdat = json['pro_createdat'];
    categorie_id = json['pro_categorie_id'];
    c_id = json['c_id'];
    c_name = json['c_name'];
    c_name_ar = json['c_name_ar'];
    c_image = json['c_image'];
    c_createdat = json['c_createdat'];
    favorite = json['favorite'];
  }
}
