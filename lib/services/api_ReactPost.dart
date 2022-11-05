import 'dart:convert';

import 'package:capstone_ui/Model/reactPost_model.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;

class ReactPostService {
  final endPointUrl = "https://als.cosplane.asia/api/reactpost/";
  static bool isCreatedReactPost = false;
  static bool isUpdatedReactPost = false;

  Future<CreateReactPostResponeModel> createReactPost(
      CreateReactPostReQuestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/reactpost/CreateReactPost";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      ReactPostService.isCreatedReactPost = true;
      return CreateReactPostResponeModel.fromJson(json.decode(response.body));
    } else {
      ReactPostService.isCreatedReactPost = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<UpdateReactPostResponeModel> updateReactPost(
      UpdateReactPostReQuestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/reactpost/UpdateStatusReactPost";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      ReactPostService.isUpdatedReactPost = true;
      return UpdateReactPostResponeModel.fromJson(json.decode(response.body));
    } else {
      ReactPostService.isUpdatedReactPost = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool isCreated() {
    return isCreatedReactPost;
  }

  bool isUpdated() {
    return isUpdatedReactPost;
  }

  Future<CheckExistReactUserResponeModel> CheckExistReact(
      CheckExistReactUserRequestModel checkExistReactUserRequestModel) async {
    String url = "https://als.cosplane.asia/api/reactpost/CheckExistReactUser";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(checkExistReactUserRequestModel.toJson()),
    );
    if (response.statusCode == 200) {
      ReactPostService.isUpdatedReactPost = true;
      return CheckExistReactUserResponeModel.fromJson(
          json.decode(response.body));
    } else {
      ReactPostService.isUpdatedReactPost = false;
      throw Exception('Lỗi dữ liệu');
    }
  }
}
