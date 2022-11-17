// TODO Implement this library.
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';

class Session {
  String? SessionID;
  String? UserID;

  Session({this.SessionID, this.UserID});

  //   Exericse(this.ExericseID,
  // this.ExerciseName,
  // this.Description,
  // this.VideoLink,
  // this.status ,
  // this.CategoryID);

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      //source: Source.fromJson(json['source']),
      SessionID: json['sessionId'] ?? '' as String,
      UserID: json['userId'] ?? '' as String,
    );
  }
}

class CreateSessionResponseModel {
  bool isSuccess;
  String message;

  CreateSessionResponseModel({
    required this.isSuccess,
    required this.message,
  });

  factory CreateSessionResponseModel.fromJson(Map<String, dynamic> json) {
    return CreateSessionResponseModel(
      isSuccess: json['success'] as bool,
      message: json['message'],
    );
  }
}

class CreateSessionRequestModel {
  String? userId;
  DateTime startTime;
  DateTime endTime;
  List<CreateSessionRequestExercise>? exercises;

  CreateSessionRequestModel({
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.exercises,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'userId': userId,
      'startTime': startTime.toIso8601String(),
      'endTime': endTime.toIso8601String(),
      'exercises': exercises,
    };
    return map;
  }
}

class CreateSessionRequestExercise {
  String? exerciseId;

  CreateSessionRequestExercise({
    this.exerciseId,
  });

  CreateSessionRequestExercise copyWith(id) {
    return CreateSessionRequestExercise(exerciseId: id);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'exerciseID': exerciseId,
    };
    return map;
  }
}

class GetSessionDetailResponseModel {
  String? exerciseId;
  String? sessionId;
  Exericse? exercise;

  GetSessionDetailResponseModel({
    this.exerciseId,
    this.sessionId,
    this.exercise,
  });

  factory GetSessionDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSessionDetailResponseModel(
      exerciseId: json['exerciseId'],
      sessionId: json['sessionId'],
      exercise: Exericse.fromJson(json['exercise']),
    );
  }
}

class GetSessionsResponseModel {
  String? userId;
  String? sessionId;
  DateTime? startTime;
  DateTime? endTime;

  GetSessionsResponseModel({
    required this.userId,
    required this.sessionId,
    this.startTime,
    this.endTime,
  });

  factory GetSessionsResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSessionsResponseModel(
      userId: json["userId"],
      sessionId: json["sessionId"],
      startTime: DateTime.parse(json["startTime"].toString()),
      endTime: DateTime.parse(json["endTime"].toString()),
    );
  }
}
