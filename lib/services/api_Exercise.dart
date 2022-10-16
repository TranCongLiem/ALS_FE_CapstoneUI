import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/Feature/News/model/article_model.dart';
import 'package:http/http.dart';

class ExerciseService {
  final endPointUrl = "http://als.cosplane.asia/api/exercise/GetAllExercise";
 // final endPointUrl = "https://newsapi.org/v2/everything?q=tesla&from=2022-09-07&sortBy=publishedAt&apiKey=2d21e21da47d4baf97f2a8e3b8981cb5";

//var endPointUrl =Uri.https('als.cosplane.asia', '/api/exercise/GetAllExercise');
//  Future<List<Exericse>> getListExercise() async {
//     Response res = await get(Uri.parse(endPointUrl));

//     if (res.statusCode == 200) {
//      // Map<String, dynamic> json = jsonDecode(res.body);
//       List<dynamic> json=jsonDecode(res.body);
//     //  List<dynamic> body = json[''];

//       // List<Exericse> exercises =
//       //     body.map((dynamic item) => Exericse.fromJson(item)).toList();
//        List<Exericse> exercises= [];
//       for (var exercise in json) {
//         exercises.add(exercise);
//       }

//     print(exercises);
//       return exercises;
//     } else {
//       throw ("Can't get the exercises");
//     }
//   }

  Future<List<Exericse>> getListExercise() async {
    
   final response = await get(Uri.parse(endPointUrl));
   print('Respone Status: ${response.statusCode}');
   print('Respone body: ${response.body}');

  // final response = await http.get(endPointUrl);    
     if (response.statusCode == 200) {
          var jsondata = json.decode(response.body);
     // final List<dynamic> result= jsonDecode(response.body);
     // print("result: + ${result}");
      List<Exericse> exercises= [];
        for (var i = 0; i < jsondata.length; i++) {
        Exericse exericse =   Exericse(
          jsondata[i]['exerciseId'],        
          jsondata[i]?['exerciseName'],         
          jsondata[i]?['description'],
          jsondata[i]?['videoLink'],
          jsondata[i]?['status'],
          jsondata[i]?['categoryName'],
        );
        exercises.add(exericse);
       
      }
       print("exercises: ${exercises.toString()}");

      return exercises;
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
}
