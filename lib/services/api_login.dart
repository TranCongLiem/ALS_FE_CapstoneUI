import 'dart:convert';
import 'package:capstone_ui/Model/login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<LoginResponeModel> login(LoginRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/LoginUserMobile";
    final response =
        await http.post(Uri.parse(url), body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
}
