class ProductModel {
  int id;
  int categoryId;
  String name;
  dynamic price;
  List<String> images;
  String details;
  int purchaseCount;
  String dateAdded;


  ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.images,
    required this.details,
    required this.purchaseCount,
    required this.dateAdded,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id']  ,
      categoryId: json['category_id'],
      name: json['name'] as String,
      price: json['price'],
      images: List<String>.from(json['images']),
      details: json['details'] as String,
      purchaseCount: json['purchase_count'] ,
      dateAdded: json['date_added'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['price'] = price;
    data['images'] = List<dynamic>.from(images);
    data['details'] = details;
    data['purchase_count'] = purchaseCount;
    data['date_added'] = dateAdded;
    return data;
  }
}
