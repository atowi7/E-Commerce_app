class CategorieModel {
  String? id;
  String? name;
  String? name_ar;
  String? image;
  CategorieModel(
    this.id,
    this.name,
    this.name_ar,
    this.image,
  
  );

  CategorieModel.fromJson(Map<String,dynamic> json){
   id=json['categorie_id'];
    name=json['categorie_name'];
     name_ar=json['categorie_name_ar'];
      image=json['categorie_image'];
  }

  // Map<String,dynamic> toJson(){
  //  Map<String,dynamic> data={};
  //  data['id'] = id;
  //   data['name'] = name;
  //    data['name_ar'] = name_ar;
  //     data['image'] = image;
  //     return data;
  // }
}
