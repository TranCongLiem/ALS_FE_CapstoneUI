import 'dart:convert';

import 'package:capstone_ui/Model/createPost_model.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:capstone_ui/Model/updatePost_model.dart';

import '../Model/getListPost_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final endPointUrl = "https://als.cosplane.asia/api/userchat/";
  var data = [];
  List<ListChat> results = [];
  Future<List<ListChat>> getAllChat(String userId, {String? query}) async {
    if ( query != '' && query.toString().trim().contains(RegExp("^[0-9]*\$"))) {
      final response2 = await http.get(
          Uri.parse(endPointUrl + "GetPhoneChattingMobile?phone=" + query.toString()));
      if (response2.statusCode == 200) {
        data = json.decode(response2.body);
        results = data.map((e) => ListChat.fromJson(e)).toList();
      } else {
        throw Exception('Lỗi dữ liệu');
      }
      return results;
    } else {
      final response = await http.get(
          Uri.parse(endPointUrl + "GetAllChattingMobile?userId=" + userId));
      print('Respone Status: ${response.statusCode}');
      print('Respone body: ${response.body}');

      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => ListChat.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.fullName!
                  .toLowerCase()
                  .contains((query.toString().toLowerCase())))
              .toList();
        }
        return results;
      } else {
        throw Exception('Lỗi dữ liệu');
      }
    }
  }
}
