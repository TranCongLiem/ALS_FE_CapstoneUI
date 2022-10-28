import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:capstone_ui/Model/createRecord_model.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:http/http.dart' as http;

import '../Model/removeRecord_model.dart';


class RecordService {
  final endPointUrl =
      "https://als.cosplane.asia/api/record/";
  static bool isCreatedRecord = false;
  static bool isRemovedRecord = false;

  Future<List<RecordById>> getRecordById() async {
    final response = await http.get(Uri.parse(endPointUrl + "GetRecordByUserId?id=43b6fcf9-b69b-40b0-93ab-87092eb25715"));
    print('Respone Status: ${response.statusCode}');
    print('Respone body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> result= jsonDecode(response.body);
      print("result: + ${result.map((e) => RecordById.fromJson(e)).toList()}");
      return result.map((e) => RecordById.fromJson(e)).toList();
    } else {
      throw Exception('Lỗi dữ liệu');
    }
  }

  Future<CreateRecordResponeModel> createRecord(CreateRecordReQuestModel requestModel) async {
    String url="https://als.cosplane.asia/api/record/CreateRecord";
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      RecordService.isCreatedRecord = true;
      return CreateRecordResponeModel.fromJson(json.decode(response.body));
    } else {
      RecordService.isCreatedRecord = false;
      throw Exception('Lỗi dữ liệu');
    }
    
  }
  Future<RemoveRecordByIdResponeModel> deleteRecord(RemoveRecordByIdRequestModel requestModel) async {
    String url="https://als.cosplane.asia/api/record/UpdateStatusRecord?recordId=" + requestModel.recordId;
    final response = await http.put(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',      
      },
      
    //  body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {
      RecordService.isRemovedRecord = true;
      return RemoveRecordByIdResponeModel.fromJson(json.decode(response.body));
    } else {
      RecordService.isRemovedRecord = false;
      throw Exception('Lỗi dữ liệu');
    }
  }


  bool isCreated() {
    return isCreatedRecord;
  }
  bool isRemoved() {
    return isRemovedRecord;
  }



}
