import 'dart:convert';

import 'package:capstone_ui/Model/createPost_model.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:capstone_ui/Model/updatePost_model.dart';

import '../Model/getListPost_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final endPointUrl = "https://als.cosplane.asia/api/UserChat/";

  Future<List<ListChat>> getAllChat(String userId) async {
    final response = await http
        .get(Uri.parse(endPointUrl + "GetAllChattingMobile?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => ListChat.fromJson(e)).toList()}");
      return result.map((e) => ListChat.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
}
