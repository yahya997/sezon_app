class CategoryModel{
  int id;
  String name;
  String image;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory CategoryModel.fromJson(Map<String,dynamic> map){
    return CategoryModel(
        image:map['image'],
        id:map['id'],
       name:map['name']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
/*
, ,
 */