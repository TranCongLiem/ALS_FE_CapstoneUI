import 'dart:convert';
import 'package:capstone_ui/Model/login_model.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/register_model.dart';

class RegisterService {
  static bool registerPatient = false;
  static bool registerSupporter = false;

  Future<RegisterResponseModel> loginPatient(
      RegisterRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/RegisterAccountPatient";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      RegisterService.registerPatient = true;
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      RegisterService.registerPatient = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<RegisterResponseModel> loginSupporter(
      RegisterRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/RegisterAccountSupporter";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      RegisterService.registerSupporter = true;
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      RegisterService.registerSupporter = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool isRegisterPatient() {
    return registerPatient;
  }

  bool isRegisterSupporter() {
    return registerSupporter;
  }
}
