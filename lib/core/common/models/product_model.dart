class ProductModel {
  final String id;
  final String name;
  final String price;
  final String description;
  final String image;
  final String categoryId;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    required this.categoryId,
  });


  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'].toString(),
      name: map['name'].toString(),
      price: map['price'].toString(),
      description: map['desc'].toString(),
      image: map['image'].toString(),
      categoryId: map['category_id'].toString(),
    );
  }
}
