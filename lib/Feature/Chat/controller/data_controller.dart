import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Model/getListChat_model.dart';
class DataController extends GetxController{

  // final String userId;
  // DataController({Key? key, required this.userId});
  var chat= [].obs;
  var filterChat = [].obs;


  var isLoading=false.obs;

  getPostsData()async{
    try{
      isLoading(true);


     var response =  await NetworkHandler.getApiCall(url: 'https://als.cosplane.asia/api/userchat/GetAllChattingMobile?userId=' + '43b6fcf9-b69b-40b0-93ab-87092eb25715');

     if(response!.statusCode == 200){

      var result = json.decode(response.body);

      result.forEach((e){
        ListChat model = ListChat.fromJson(e);
        chat.add(model);
      });

      filterChat = chat;



     }else{
       Get.snackbar('Failed', 'Error while getting data from internet');
     }

    }catch(e){
      chat.value = [];
      filterChat.value = [];
    }finally{
      isLoading(false);
    }
  }



  resetBack(){
    filterChat.value = chat;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPostsData();
  }

}

class NetworkHandler{

  static Future<http.Response?> getApiCall({String? url})async{

    try{
      final response = await http.get(Uri.parse(url!));
      return response;
    }catch(e){
      print("Got error $e");
    }
}
}