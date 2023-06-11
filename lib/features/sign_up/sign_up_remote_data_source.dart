import 'package:projectfinal/core/server/api.dart';
import 'package:projectfinal/core/server/api_url.dart';

class SignupRemoteDataSource {
  final Api api = ApiImpl();

  Future<bool> signup(
      {required String fName,
      required String lName,
      required String email,
      required String address,
      required String password,
      required String phone}) async {
    try {
      final request = ApiRequest(url: ApiUrl.register, params: {
        "fname": fName,
        "lname": lName,
        "email": email,
        "address": address,
        "phone": phone,
        "password": password,
      });

      final response = await api.post(request);
      if (response.success) {
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
