// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// var _apikey='AIzaSyBO_-M3SNtTE4YX46OKUO2dxOZX2XnbvUI';
// Future<http.Response> voiceResponse (String text) async{
//   String url= 'https://texttospeech.googleapis.com/v1beta1/text:synthesize?key=$_apikey';
//   var body= jsonEncode(
//       {
//         "audioConfig": {
//           "audioEncoding": "LINEAR16",
//           "pitch": 1.6,
//           "speakingRate": 1.19
//         },
//         "input": {
//           "text": text
//         },
//         "voice": {
//           "languageCode": "vi-VN",
//           "name": "vi-VN-Wavenet-A"
//         }
//       }
//   );
//   var response= http.post(Uri.parse(url),
//     headers: {"Content-type": "application/json"},
//     body:body
//   );
//   return response;
// }