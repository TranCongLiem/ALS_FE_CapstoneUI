import 'dart:convert';

import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/Model/session_model.dart';
import 'package:http/http.dart' as http;

class SessionService {
  Future<CreateSessionResponseModel> createSession(
      CreateSessionRequestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/exercise/AddSessionAndSessionDetail/";
    //var body = jsonEncode(requestModel.toJson());
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return CreateSessionResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<GetSessionsResponseModel>> getSessionsByUserId(
      String userId) async {
    String url =
        "https://als.cosplane.asia/api/exercise/GetSessionByUserId?userId=";
    final response = await http.get(Uri.parse(url + userId));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => GetSessionsResponseModel.fromJson(e)).toList()}");
      return result.map((e) => GetSessionsResponseModel.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<GetSessionDetailResponseModel>> getSessionsDetail(
      String? sessionId) async {
    String url =
        "https://als.cosplane.asia/api/exercise/GetSessionDetailBySessionId?sessionId=";
    final response = await http.get(Uri.parse(url + sessionId!));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => GetSessionDetailResponseModel.fromJson(e)).toList()}");
      return result
          .map((e) => GetSessionDetailResponseModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<CreateSessionHistoryResponseModel> createSessionHistory(
      CreateSessionHistoryRequestModel requestModel) async {
    String url =
        "https://als.cosplane.asia/api/PracticeHistoryDetail/AddPracticeHistoryAndDetail/";
    //var body = jsonEncode(requestModel.toJson());
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return CreateSessionHistoryResponseModel.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<GetSessionHistoryResponseModel>> getSessionHistory(
      String? userId) async {
    String url =
        "http://als.cosplane.asia/api/PracticeHistoryDetail/GetPracticeHistoryByUserId?userId=";
    final response = await http.get(Uri.parse(url + userId!));

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => GetSessionHistoryResponseModel.fromJson(e)).toList()}");
      return result
          .map((e) => GetSessionHistoryResponseModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
}
