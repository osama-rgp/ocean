

class  ProductModel{

  final String id;
  final String categoryId;
  final String name , description;
  final double price;

  const ProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
  });
}