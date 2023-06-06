
class ProductModel{

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

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'description': this.description,
      'image': this.image,
      'categoryId': this.categoryId,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      categoryId: map['category_id'] as String,
    );
  }
}