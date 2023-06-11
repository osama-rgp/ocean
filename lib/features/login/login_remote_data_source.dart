import 'package:projectfinal/core/server/api.dart';
import 'package:projectfinal/core/server/api_url.dart';

import '../../core/common/models/product_model.dart';

class RemoteDataSource {
  final Api api = ApiImpl();

  Future<Map> login(String email, String password) async {
    try {
      final request = ApiRequest(url: ApiUrl.login, params: {
        "email": email,
        "password": password,
      });
      final response = await api.post(request);
      final body = response.body;
      if (body is Map) {
        return body;
      } else {
        throw Exception("");
      }
    } catch (e) {
      return {"error": "the email or password is not valid"};
    }
  }

  Future<List<ProductModel>> getAllProduct() async {
    try {
      const request = ApiRequest(
        url: ApiUrl.login,
      );
      final response = await api.post(request);
      final body = response.body;
      if (body is Map) {
        return [];
      } else {
        throw Exception("");
      }
    } catch (e) {
      return [];
    }
  }
}
