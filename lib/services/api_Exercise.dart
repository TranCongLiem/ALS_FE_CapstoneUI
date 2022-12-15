import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/Feature/News/model/article_model.dart';
import 'package:http/http.dart';

class ExerciseService {
  //final getListExerciseByCategory = "http://als.cosplane.asia/api/exercise/GetAllExercise";
  final getListExerciseByCategory =
      "https://als.cosplane.asia/api/exercise/GetExerciseByCategoryId?categoryID=";
  final getListExercise =
      "https://als.cosplane.asia/api/exercise/GetAllExercise";

  Future<List<Exericse>> getListExerciseByCateId(String categoryId) async {
    final response =
        await get(Uri.parse(getListExerciseByCategory + categoryId));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    // final response = await http.get(endPointUrl);
    if (response.statusCode == 200) {
      //------//
      // var jsondata = json.decode(response.body);
      // List<Exericse> exercises = [];
      // for (var i = 0; i < jsondata.length; i++) {
      //   Exericse exericse = Exericse(
      //     jsondata[i]['exerciseId'],
      //     jsondata[i]?['exerciseName'],
      //     jsondata[i]?['description'],
      //     jsondata[i]?['videoLink'],
      //     jsondata[i]?['status'],
      //     jsondata[i]?['categoryName'],
      //   );
      //   exercises.add(exericse);
      // }
      //------//
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => Exericse.fromJson(e)).toList()}");
      return result.map((e) => Exericse.fromJson(e)).toList();
      // for (var element in result) {
      //  // Exericse exericse = Exericse.fromJson(element);
      //  Exericse exericse= Exericse(
      //  ExericseID:  element.ExericseID,
      //  ExerciseName:  element.ExerciseName,
      //  VideoLink: element.VideoLink,
      //  Description: element.Description,
      //  status: element.status,
      //  CategoryID: element.CategoryID,

      //  );
      //   exercises.add(exericse);
      // }
      // print("List exercises: + ${result.map((e) => Exericse.fromJson(e)).toList()}");
      //return result.map((e) => Exericse.fromJson(e)).toList();
      // print("exercises: ${exercises}");
      // return exercises;
      // Map<String, dynamic> json = jsonDecode(response.body);
      // List<dynamic> json=jsonDecode(res.body);
      //List<dynamic> body = json;
      // List<Exericse> list_Exercise= jsonDecode(response.body);
      //List<Exericse> exercises =json
      //body.map((dynamic item) => Exericse.fromJson(item)).toList();
      // return list_Exercise;
      //List<Exericse> exercises = [];
      // if (response.statusCode == 200) {
      //   var jsondata = json.decode(response.body);

      //   for (var i = 0; i < jsondata.length; i++) {
      //     Exericse exericse = new  Exericse(
      //       jsondata[i]['ExericseID'],
      //       jsondata[i]?['ExerciseName'],
      //       jsondata[i]?['Description'],
      //       jsondata[i]?['VideoLink'],
      //       jsondata[i]?['status'],
      //       jsondata[i]?['CategoryID'],
      //     );
      //     exercises.add(exericse);

      //   }
      // return exercises;
    } else {
      throw Exception("Failed to load Exercise");
    }
  }


  Future<List<Exericse>> getListExerciseByName(String name) async {
    final String url="https://als.cosplane.asia/api/exercise/SearchExerciseByName?name=";
    final response =
        await get(Uri.parse(url + name));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    
    if (response.statusCode == 200) {
      
      final List<dynamic> result = jsonDecode(response.body);
      print("result: + ${result.map((e) => Exericse.fromJson(e)).toList()}");
      return result.map((e) => Exericse.fromJson(e)).toList();
      
    } else {
      throw Exception("Failed to load Exercise by Name");
    }
  }

  Future<List<Exericse>> getAllExercise() async {
    Response response = await get(Uri.parse(getListExercise));

    if (response.statusCode == 200) {     
      List<Exericse> exercises = [];
      final List<dynamic> result= jsonDecode(response.body);
       print("result: + ${result.map((e) => Exericse.fromJson(e)).toList()}");
      return result.map((e) => Exericse.fromJson(e)).toList();
      //--------------

      return exercises;
    } else {
      throw ("Can't get the Exercises");
    }
  }
}
