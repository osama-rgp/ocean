import 'package:projectfinal/core/common/models/product_model.dart';
import 'package:projectfinal/core/server/api.dart';
import 'package:projectfinal/core/server/api_url.dart';

List<ProductModel> filteredProducts  = [];
List<ProductModel> allProducts = [];
class HomePageRemoteDataSource {
  static final Api api = ApiImpl();

  static Future<List<ProductModel>> getAllProducts() async {
    if(allProducts.isNotEmpty)
      return filteredProducts ;
    const request = ApiRequest(
        url: ApiUrl.products, headers: {"Accept": "Application/json"});
    final response = await api.get(request);

    if (response.body != null) {
      final List responseList = response.body!['prodacts'];
      final List<ProductModel> product = [];
      for (Map value in responseList) {
        product.add(ProductModel.fromMap(value as Map<String, dynamic>));
      }
      filteredProducts = product;
      allProducts = product;
      return product;
    }
    return [];
  }
}
