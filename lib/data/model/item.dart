class ItemModel {
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
  ItemModel(
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
      this.c_createdat);
  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name_ar = json['name_ar'];
    description = json['description'];
    description_ar = json['description_ar'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    active = json['active'];
    count = json['count'];
    createdat = json['createdat'];
    categorie_id = json['categorie_id'];
    c_id = json['c_id'];
    c_name = json['c_name'];
    c_name_ar = json['c_name_ar'];
    c_image = json['c_image'];
    c_createdat = json['c_createdat'];
  }
}
