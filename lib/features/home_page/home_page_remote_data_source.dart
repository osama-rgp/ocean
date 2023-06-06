import 'package:projectfinal/core/common/models/product_model.dart';
import 'package:projectfinal/core/server/api.dart';
import 'package:projectfinal/core/server/api_url.dart';

class HomePageRemoteDataSource {
  static final Api api = ApiImpl();

  static Future<List<ProductModel>> getAllProducts() async {
    const request = ApiRequest(
        url: ApiUrl.products, headers: {"Accept": "Application/json"});
    final response = await api.get(request);
    if(response.body!=null){
      final List<Map> responseList = response.body!['products'];
      final List<ProductModel> product  =[];
      for(Map value in responseList){
        product.add(ProductModel.fromMap(value as Map<String,dynamic>));
      }
      return product;
    }
    return [];
  }
}
