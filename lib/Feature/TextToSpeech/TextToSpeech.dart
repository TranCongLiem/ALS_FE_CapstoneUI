import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capstone_ui/Splash/SharePreKey.dart';

class TextToSpeech extends StatefulWidget {
  const TextToSpeech({Key? key}) : super(key: key);

  @override
  State<TextToSpeech> createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  var list_old_word = List<String>.empty(growable: true);
  TextEditingController textEditingController = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOldText();
  }

  getOldText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list_old_word_cache = prefs.getStringList(SharedPreferencesKey.list_old_word_cache) ?? [];
    if (!list_old_word_cache.isEmpty) {
      setState(() {
        for (var word in list_old_word_cache) {
          list_old_word.add(word);
        }
      });
    }
  }
speak(String text) async {
    await flutterTts.setLanguage("vi-VN");
    await flutterTts.speak(text);
    await flutterTts.synthesizeToFile(text, 'test.mp3');
  }
  bool checkBeforeAdd(String newWord, List<String> list_old_word) {
    bool isAdd = false;
    if (list_old_word.isEmpty) {
      isAdd = true;
    } else {
      for (var word in list_old_word) {
        if (word.toLowerCase() == newWord.toLowerCase()) {
          return isAdd = false;
        } else {
          isAdd = true;
        }
      }
    }

    return isAdd;
  }

  addAndSave(String newWord, List<String> list_old_word) async {
    list_old_word.add(newWord);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(SharedPreferencesKey.list_old_word_cache, list_old_word);
  }

  removeAndSave(int index, List<String> list_old_word) async {
    list_old_word.removeAt(index);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(SharedPreferencesKey.list_old_word_cache, list_old_word);
  }
  //---------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chuyển văn bản thành giọng nói'),
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/anh_web.png"),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    //height: size.height * 1/10,
                    child: TextFormField(
                      maxLines: 5,
                      autofocus: true,
                      decoration: InputDecoration(
                          hintText: 'Nhập để nói',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              width: 10,
                            ),
                          )),
                      controller: textEditingController,
                      style: TextStyle(fontSize: 32.0, color: Colors.black),
                    ),
                  ),
                ),
                
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      primary: false,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),                    
                      itemCount: list_old_word.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            //title: Text('1'),

                            title: Text('${list_old_word[index]}'),
                            onTap: () {
                              textEditingController.text = list_old_word[index];
                            },
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    removeAndSave(index, list_old_word);
                                  });
                                },
                                icon: Icon(Icons.delete,
                                    color: Colors.red, size: 32)),

                            //  icon: Icon(Icons.delete, color: Colors.red,size: 32)),
                          ),
                        );
                      }),
                ),
                Container(
                  // height: size.height * 1/4,
                  child: ElevatedButton(
                    child: Text("Nhấn để phát"),
                    onPressed: () {
                      speak(textEditingController.text);
                      // print(list_old_word);
                      setState(() {
                        //getOldText();
                        bool isAdd = checkBeforeAdd(
                            textEditingController.text, list_old_word);
                        if (isAdd) {
                          addAndSave(textEditingController.text, list_old_word);
                        }
                      });
                    //  print('abc $list_old_word');
                      //print(list_Voices);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.normal,
                        ),
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20)),
                  ),
                )
              ],
            )));
  }
  //---------------//

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chuyển văn bản thành giọng nói'),
//         backgroundColor: greenALS,
//       ),
//       body: Home(),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   final FlutterTts flutterTts = FlutterTts();
//   TextEditingController textEditingController = TextEditingController();
//   speak(String text) async {
//     await flutterTts.setLanguage("vi-VN");
//     await flutterTts.speak(text);
//     await flutterTts.synthesizeToFile(text, 'test.mp3');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Flexible(
//             flex: 1,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
//               child: TextFormField(
//                 maxLines: 5,
//                 autofocus: true,
//                 decoration: InputDecoration(
//                     hintText: 'Nhập để nói',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide(width: 10, color: greenALS),
//                     )),
//                 controller: textEditingController,
//                 style: TextStyle(fontSize: 32.0, color: Colors.black),
//               ),
//             ),
//           ),
//           Text(
//             'Lịch sử',
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontSize: 30.0,
//             ),
//           ),
//           saveText(),
//           ElevatedButton(
//             child: Text("Nhấn để phát"),
//             onPressed: () => speak(textEditingController.text),
//             style: ElevatedButton.styleFrom(
//               primary: Colors.green,
//               textStyle: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontStyle: FontStyle.normal,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
}

// Widget saveText() => Expanded(
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         primary: false,
//         shrinkWrap: true,
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('1'),
//           );
//         },
//       ),
//     );
