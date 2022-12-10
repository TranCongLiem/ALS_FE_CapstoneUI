import 'dart:convert';

import 'package:capstone_ui/Model/AddRelationshipWithPatient_model.dart';
import 'package:capstone_ui/Model/getProfileUser_model.dart';
import 'package:capstone_ui/Model/updateProfilePatient_model.dart';
import 'package:http/http.dart' as http;

import '../Model/updateProfileSupporter_model.dart';

class UserPatientService {
  final endPointUrl = "https://als.cosplane.asia/api/user/";
  static bool isUpdateProfilePatient = false;

  static bool isUpdateInformationPatient = false;
  static bool isUpdateInformationSupporter = false;
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

  Future<UpdateProfilePatientResponeModel> updateInformationPatient(
      UpdateInformationPatientRequestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/UpdateInformationPatient?id=" +
            requestModel.userId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      UserPatientService.isUpdateInformationPatient = true;
      return UpdateProfilePatientResponeModel.fromJson(
          json.decode(response.body));
    } else {
      UserPatientService.isUpdateInformationPatient = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<UpdateProfilePatientResponeModel> updateInformationSupporter(
      UpdateInformationSupporterRequestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/UpdateInformationSupporter?id=" +
            requestModel.userId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      UserPatientService.isUpdateInformationSupporter = true;
      return UpdateProfilePatientResponeModel.fromJson(
          json.decode(response.body));
    } else {
      UserPatientService.isUpdateInformationSupporter = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

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

  Future<AddRelationwithPatientResponse> AddRelationWithPatient(
      AddRelationwithPatientRequest requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/AddRelationShipWithPatient";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return AddRelationwithPatientResponse.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
  Future<GetDetailUserByPhoneResponse> GetDetailUserByPhone(
      GetDetailUserByPhoneRequest requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/GetDetailUserByPhone?id=" + requestModel.patientPhoneNumber;
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      //body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GetDetailUserByPhoneResponse.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
  Future<DeleteRelationwithPatientResponse> DeleteRelationwithPatient(
      DeleteRelationwithPatientRequest requestModel) async {
    String url =
        "https://als.cosplane.asia/api/user/DeleteRelationship";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return DeleteRelationwithPatientResponse.fromJson(
          json.decode(response.body));
    } else {
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
  Future<GetProfilePatientInSupporterByIdResponeModel> getProfilePatientInRoleSupporterById(
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
      return GetProfilePatientInSupporterByIdResponeModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GetRelatinshipWithUserByIdResponeModel> getRelatinshipWithUserById(
      GetRelatinshipWithUserByIdRequestModel requestModel) async {
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
      return GetRelatinshipWithUserByIdResponeModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
   Future<GetPhoneResponeModel> checkPhoneNumber(GetPhoneRequestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/user/CheckPhoneExistInSystem?phoneNumber=" + requestModel.phoneNumber;
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },

      //  body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GetPhoneResponeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GetPhoneByIdResponeModel> getPhoneNumberById(
      GetPhoneByIdRequestModel requestModel) async {
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
      return GetPhoneByIdResponeModel.fromJson(json.decode(response.body));
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
