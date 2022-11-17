import 'dart:convert';

import '../Model/groupChat_model.dart';
import 'package:http/http.dart' as http;

class GroupChatService {
  final endPointUrl = "https://als.cosplane.asia/api/groupchat/";
  static bool isCreatedPost = false;

  Future<List<ListAllGroupChat>> getAllGroupChat(String userId) async {
    final response = await http
        .get(Uri.parse(endPointUrl + "GetAllGroupChat?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => ListAllGroupChat.fromJson(e)).toList()}");
      return result.map((e) => ListAllGroupChat.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<ListAllGroupChatUserJoin>> getAllGroupChatUserJoin(
      String userId) async {
    final response = await http.get(
        Uri.parse(endPointUrl + "GetAllGroupChatUserJoin?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => ListAllGroupChatUserJoin.fromJson(e)).toList()}");
      return result.map((e) => ListAllGroupChatUserJoin.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
}
