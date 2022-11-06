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

  
  
}
