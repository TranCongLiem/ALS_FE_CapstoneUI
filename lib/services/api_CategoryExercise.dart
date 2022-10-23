import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:http/http.dart';

class CategoryExerciseService {
  final endPointUrl =
      "https://als.cosplane.asia/api/CategoryExercise/GetAllCategoryExercise";

  Future<List<CategoryExercise>> getListCategoryExercise() async {
    final response = await get(Uri.parse(endPointUrl));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    // final response = await http.get(endPointUrl);
    if (response.statusCode == 200) {
      //var jsondata = json.decode(response.body);
      // final List<dynamic> result= jsonDecode(response.body);
      // print("result: + ${result}");
      List<CategoryExercise> categoryExercises = [];
      final List<dynamic> result= jsonDecode(response.body);
       print("result: + ${result.map((e) => CategoryExercise.fromJson(e)).toList()}");
      return result.map((e) => CategoryExercise.fromJson(e)).toList();
      //--------------
      //   for (var i = 0; i < jsondata.length; i++) {
      //   CategoryExercise exericse =   CategoryExercise(
      //     jsondata[i]['categoryId'],
      //     jsondata[i]?['catgegoryName'],
      //     jsondata[i]?['categoryImage'],

      //   );
      //   exercises.add(exericse);

      // }
     // print("exercises: ${exercises.toString()}");

     // return exercises;
      //-------------
     // categoryExercises= jsondata.map((dynamic item) => CategoryExercise.fromJson

     
    } else {
      throw Exception("Failed to load Exercise");
    }

  }

  
  
}
