
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/textToSpeech_model.dart';

class FPTAIService{
  final textToSpeechUrl = "https://als.cosplane.asia/api/fptai/TextToSpeech";

  Future<TextToSpeechResponeModel> convertTextToSpeech(TextToSpeechRequestModel requestModel) async {   
    final response = await http.post(
      Uri.parse(textToSpeechUrl),
      headers: {
        'Content-Type': 'application/json',      
      },
      body: jsonEncode(requestModel.toJson()),
    );
    if (response.statusCode == 200) {     
      return TextToSpeechResponeModel.fromJson(json.decode(response.body));
    } else {    
      throw Exception('Lỗi dữ liệu');
    }
  }
}
     