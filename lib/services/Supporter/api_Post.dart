import 'dart:convert';

import 'package:capstone_ui/Model/createPost_model.dart';

import '../Model/getListPost_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  final endPointUrl =
      "https://als.cosplane.asia/api/post/";
  static bool isCreatedPost = false;

  Future<List<ListPost>> getAllPost() async {
    final response = await http.get(Uri.parse(endPointUrl + "GetAllPostMobile?userId=B9C5D58B-45A4-4E71-800B-ECE47CEED913"));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result= jsonDecode(response.body);
      print("result: + ${result.map((e) => ListPost.fromJson(e)).toList()}");
      return result.map((e) => ListPost.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }


  Future<CreatePostResponeModel> createPost(CreatePostReQuestModel requestModel) async {
    String url="https://als.cosplane.asia/api/post/CreatePost";
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


  bool isCreated() {
    return isCreatedPost;
  }




}