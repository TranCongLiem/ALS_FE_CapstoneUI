import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/getDetailKnowledge_model.dart';
import 'package:http/http.dart';

class DetailKnowledgeService {
  final getListDetailKnowledge =
      "http://als.cosplane.asia/api/News/GetDetailNewsByNewsId?id=";

  Future<List<DetailKnowledge>> getListDetailKnowledgeById(
      String newsId) async {
    final response = await get(Uri.parse(getListDetailKnowledge + newsId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => DetailKnowledge.fromJson(e)).toList()}");
      return result.map((e) => DetailKnowledge.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load knowledge");
    }
  }
}
