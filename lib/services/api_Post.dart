import 'dart:convert';

import 'package:capstone_ui/Model/createPost_model.dart';
import 'package:capstone_ui/Model/updatePost_model.dart';

import '../Model/getListPost_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  final endPointUrl = "https://als.cosplane.asia/api/post/";
  static bool isCreatedPost = false;

  Future<List<ListPost>> getAllPost(String userId) async {
    final response = await http
        .get(Uri.parse(endPointUrl + "GetAllPostMobile?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => ListPost.fromJson(e)).toList()}");
      return result.map((e) => ListPost.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<List<ListPost>> getPostByUserId(String userId) async {
    final response = await http.get(
        Uri.parse(endPointUrl + "GetAllByUserIdPostMobile?userId=" + userId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => ListPost.fromJson(e)).toList()}");
      return result.map((e) => ListPost.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<CreatePostResponeModel> createPost(
      CreatePostReQuestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/post/CreatePost";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      PostService.isCreatedPost = true;
      return CreatePostResponeModel.fromJson(json.decode(response.body));
    } else {
      PostService.isCreatedPost = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<UpdatePostResponeModel> updateIsPublicPost(
      UpdatePostReQuestModel requestModel) async {
    String url = "https://als.cosplane.asia/api/post/UpdateIsPublicPost";
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      PostService.isCreatedPost = true;
      return UpdatePostResponeModel.fromJson(json.decode(response.body));
    } else {
      PostService.isCreatedPost = false;
      throw Exception('Lỗi dữ liệu');
    }
  }

  bool isCreated() {
    return isCreatedPost;
  }
}
