import 'dart:convert';

import '../Model/groupChat_model.dart';
import 'package:http/http.dart' as http;

class GroupChatService {
  final endPointUrl = "https://als.cosplane.asia/api/groupchat/";
  static bool isCreatedPost = false;
  static bool isRemovedMember = false;

  var data = [];
  List<ListAllGroupChat> results = [];
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

  Future<List<ListGetAllUserInGroupChat>> getAllUserInGroupChat(
      String groupId) async {
    final response = await http.get(
        Uri.parse(endPointUrl + "GetAllUserInGroupChat?groupId=" + groupId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print(
          "result: + ${result.map((e) => ListGetAllUserInGroupChat.fromJson(e)).toList()}");
      return result.map((e) => ListGetAllUserInGroupChat.fromJson(e)).toList();
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
    String url =
        "https://als.cosplane.asia/api/groupchat/UpdateLastMessageGroupChat";
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

  Future<List<ListAllGroupChat>> getAllGroupChatSearch(String userId,
      {String? query}) async {
    final response = await http
        .get(Uri.parse(endPointUrl + "GetAllGroupChat?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    // if (response.statusCode == 200) {
    //   final List<dynamic> result = jsonDecode(response.body);
    //   print(
    //       "result: + ${result.map((e) => ListAllGroupChat.fromJson(e)).toList()}");
    //   return result.map((e) => ListAllGroupChat.fromJson(e)).toList();
    // }
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      results = data.map((e) => ListAllGroupChat.fromJson(e)).toList();
      if (query != null) {
        results = results
            .where((element) => element.groupChatName!
                .toLowerCase()
                .contains((query.toString().toLowerCase())))
            .toList();
      }
      return results;
    } else {
      throw Exception('Lỗi dữ liệu');
    }
    
  }
   Future<RemoveMemberInGroupResponeModel> removeMember(RemoveMemberInGroupRequestModel requestModel) async {
    String url="https://als.cosplane.asia/api/groupchat/RemoveMemberInGroup?groupId=" + requestModel.groupId + "&userId=" + requestModel.userId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',      
      },
      
    //  body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      GroupChatService.isRemovedMember = true;
      return RemoveMemberInGroupResponeModel.fromJson(json.decode(response.body));
    } else {
      GroupChatService.isRemovedMember = false;
      throw Exception('Lỗi dữ liệu');
    }
  }
}
