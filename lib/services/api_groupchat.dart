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

  Future<GroupChatResponeModel> createGroupChat(
      CreateGroupChatRequest requestModel) async {
    String url = "https://als.cosplane.asia/api/groupchat/CreateGroupChat";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GroupChatResponeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GroupChatResponeModel> updateLastMessageGroupChat(
      UpdateLastMessageGroupChatRequest requestModel) async {
    String url = "https://als.cosplane.asia/api/groupchat/UpdateLastMessageGroupChat";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GroupChatResponeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<GroupChatResponeModel> addMemberGroupChat(
      AddMemberGroupChatRequest requestModel) async {
    String url = "https://als.cosplane.asia/api/groupchat/AddMemberGroupChat";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      return GroupChatResponeModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }
}
