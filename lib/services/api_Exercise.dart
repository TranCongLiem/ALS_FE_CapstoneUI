import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/Feature/News/model/article_model.dart';
import 'package:http/http.dart';

class ExerciseService {
  final getListExerciseByCategory =
      "https://als.cosplane.asia/api/exercise/GetExerciseByCategoryId?categoryID=";

  Future<List<Exericse>> getListExerciseByCateId(String categoryId) async {
    final response =
        await get(Uri.parse(getListExerciseByCategory + categoryId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => Exericse.fromJson(e)).toList()}");
      return result.map((e) => Exericse.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load Exercise");
    }
  }
}
