import 'dart:convert';
import 'package:capstone_ui/Model/UpdateDeviceTokenMobile.dart';
import 'package:capstone_ui/Model/login_model.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../Model/register_model.dart';

class UserService {
  static bool authenticated = false;
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
      UserService.registerPatient = true;
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      UserService.registerPatient = false;
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
      UserService.registerSupporter = true;
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      UserService.registerSupporter = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool isRegisterPatient() {
    return registerPatient;
  }

  bool isRegisterSupporter() {
    return registerSupporter;
  }

  Future<LoginResponeModel> login(LoginRequestModel requestModel) async {
    //String url = "https://reqres.in/api/login";

    String url = "https://als.cosplane.asia/api/user/LoginUserMobile";


    // final response= await http.post(Uri.parse(url), body: requestModel.toJson());
    // if(response.statusCode == 200 || response.statusCode == 400){
    //   return LoginResponeModel.fromJson(json.decode(response.body));
    // }else{
    //   throw Exception('Lỗi dữ liệu');
    // }

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      LoginResponeModel a = new LoginResponeModel();
      if(response.body == 'Invalid Phone or Password'){
        return a;
      }else{
        UserService.authenticated = true;
        return LoginResponeModel.fromJson(json.decode(response.body));
      }
    } else {
      UserService.authenticated = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<UpdateDevicetokenMobileResponse> updateDeviceTokenMobile(
      UpdateDevicetokenMobileRequest requestModel) async {
    String url = "https://als.cosplane.asia/api/user/UpdateDeviceMobileToken";

    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == HttpStatus.ok) {
      return UpdateDevicetokenMobileResponse.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool Logout(){
     authenticated=false;
    return authenticated;
  }
  bool isUserAuthenticated() {
    return authenticated;
  }
}
