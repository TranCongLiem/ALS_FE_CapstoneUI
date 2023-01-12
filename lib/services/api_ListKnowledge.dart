// import 'dart:convert' as convert;
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
// import 'package:http/http.dart';
//
// import '../Model/getListKnowledge_model.dart';
//
// class ListKnowledgeService {
//   final endPointUrl =
//       "https://als.cosplane.asia/api/News/GetAllNews";
//
//   Future<List<ListKnowledge>> getListKnowledge() async {
//     final response = await get(Uri.parse(endPointUrl));
//     print('Respone Status: ${response.statusCode}');
//     print('Respone body: ${response.body}');
//     if (response.statusCode == 200) {
//       List<ListKnowledge> listKnowledge = [];
//       final List<dynamic> result= jsonDecode(response.body);
//        print("result: + ${result.map((e) => ListKnowledge.fromJson(e)).toList()}");
//       return result.map((e) => ListKnowledge.fromJson(e)).toList();
//     } else {
//       throw Exception("Failed to load Exercise");
//     }
//
//   }
//
//
//
// }
import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart';

import '../Model/getListKnowledge_model.dart';

class ListKnowledgeService {
  final endPointUrl =
      "https://als.cosplane.asia/api/News/GetAllNews";

  Future<List<ListKnowledge>> getListKnowledge() async {
    final response = await get(Uri.parse(endPointUrl));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');
    if (response.statusCode == 200) {
      List<ListKnowledge> listKnowledge = [];
      final List<dynamic> result= jsonDecode(response.body);
      print("result: + ${result.map((e) => ListKnowledge.fromJson(e)).toList()}");
      return result.map((e) => ListKnowledge.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load Exercise");
    }

  }
  Future<DetailKnowledgeResponse> GetDetailKnowLedgeById(
      GetDetailKnowLedgeByIdRequest requestModel) async {
    String url = "https://als.cosplane.asia/api/News/GetDetailNewsAndNewsByNewsId?id=" +
        requestModel.newsId;
    final response = await get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },

      //  body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return DetailKnowledgeResponse.fromJson(
          json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<ListKnowledge>> GetKnowLedgeByCategoryId(GetKnowledgeByCategoryKnowledgeIdRequest request) async {
    String url="https://als.cosplane.asia/api/News/GetNewsByCategoryId?categoryNewsId=" +request.CategoryKnowLedeId;
    final response = await get(Uri.parse(url));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');
    if (response.statusCode == 200) {
      //List<ListKnowledge> listKnowledge = [];
      final List<dynamic> result= jsonDecode(response.body);
      print("result: + ${result.map((e) => ListKnowledge.fromJson(e)).toList()}");
      return result.map((e) => ListKnowledge.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load List KnowLedge");
    }

  }

  Future<List<CategoryNewsKnowLedgeResponse>> GetAllCategoryKnowLedge() async {
    String url= "https://als.cosplane.asia/api/categoryNew/GetAllCategoryNew";
    final response = await get(Uri.parse(url));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');
    if (response.statusCode == 200) {
      // List<ListKnowledge> listKnowledge = [];
      final List<dynamic> result= jsonDecode(response.body);
      print("result: + ${result.map((e) => ListKnowledge.fromJson(e)).toList()}");
      return result.map((e) => CategoryNewsKnowLedgeResponse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load CategoryKnowLedge");
    }

  }


}