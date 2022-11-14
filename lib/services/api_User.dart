import 'dart:convert';

import 'package:capstone_ui/Model/getProfileUser_model.dart';
import 'package:capstone_ui/Model/updateProfilePatient_model.dart';
import 'package:http/http.dart' as http;

import '../Model/updateProfileSupporter_model.dart';

class UserPatientService {
  final endPointUrl = "https://als.cosplane.asia/api/user/";
  static bool isUpdateProfilePatient = false;

  static bool isUpdateInformationPatient = false;

  static bool isUpdateProfileSupporter = false;


  Future<UpdateProfilePatientResponeModel> updateProfilePatient(
      UpdateProfilePatientRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/UpdateProfilePatient?id=" +
        requestModel.userId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      UserPatientService.isUpdateProfilePatient = true;
      return UpdateProfilePatientResponeModel.fromJson(
          json.decode(response.body));
    } else {
      UserPatientService.isUpdateProfilePatient = false;
      throw Exception('Lỗi dữ liệu');
    }
  }


  Future<UpdateProfilePatientResponeModel> updateInformationPatient(UpdateInformationPatientRequestModel requestModel) async {
    String url="https://als.cosplane.asia/api/user/UpdateInformationPatient?id=" + requestModel.userId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',      
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      UserPatientService.isUpdateInformationPatient = true;
      return UpdateProfilePatientResponeModel.fromJson(json.decode(response.body));
    } else {
      UserPatientService.isUpdateInformationPatient = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GetProfileUserByIdResponeModel> getProfileUserById(GetProfileUserByIdRequestModel requestModel) async {
    String url="https://als.cosplane.asia/api/user/GetDetailUserByID?id=" + requestModel.userId;
    final response = await http.get(

  Future<UpdateProfileSupporterResponeModel> updateProfileSupporter(
      UpdateProfileSupporterRequestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/UpdateProfileSupporter?id=" +
            requestModel.userId;
    final response = await http.put(

      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      UserPatientService.isUpdateProfileSupporter = true;
      return UpdateProfileSupporterResponeModel.fromJson(
          json.decode(response.body));
    } else {
      UserPatientService.isUpdateProfileSupporter = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GetProfileUserByIdResponeModel> getProfileUserById(
      GetProfileUserByIdRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/GetDetailUserByID?id=" +
        requestModel.userId;
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },

      //  body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GetProfileUserByIdResponeModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool isUpdatedProfilePatient() {
    return isUpdateProfilePatient;
  } 
  bool isUpdatedInformationPatient() {
    return isUpdateInformationPatient;
  }

  bool isUpdatedProfileSupporter() {
    return isUpdateProfileSupporter;
  }
}
