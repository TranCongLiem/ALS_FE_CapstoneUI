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
  String? gender;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOldText();
  }

  getOldText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var list_old_word_cache =
        prefs.getStringList(SharedPreferencesKey.list_old_word_cache) ?? [];
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
    await prefs.setStringList(
        SharedPreferencesKey.list_old_word_cache, list_old_word);
  }

  removeAndSave(int index, List<String> list_old_word) async {
    list_old_word.removeAt(index);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        SharedPreferencesKey.list_old_word_cache, list_old_word);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chuyển văn bản thành giọng nói'),
          backgroundColor: greenALS,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextFormField(
                      maxLines: 5,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Nhập để nói',
                      ),
                      controller: textEditingController,
                      style: TextStyle(fontSize: 32.0, color: Colors.black),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  height: 50,
                  endIndent: 50,
                  indent: 50,
                ),
                // Container(
                //   padding: EdgeInsets.all(8.0),
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     'Lịch sử',
                //     style: TextStyle(
                //         fontSize: 35.0,
                //         color: Colors.black87,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                // Expanded(
                //   child: ListView.builder(
                //       scrollDirection: Axis.vertical,
                //       primary: false,
                //       shrinkWrap: true,
                //       physics: BouncingScrollPhysics(),
                //       itemCount: list_old_word.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           child: ListTile(
                //             title: Text(
                //               '${list_old_word[index]}',
                //               style: TextStyle(
                //                   fontSize: 28.0,
                //                   fontWeight: FontWeight.w600,
                //                   color: Colors.black45),
                //             ),
                //             onTap: () {
                //               textEditingController.text = list_old_word[index];
                //             },
                //             trailing: IconButton(
                //                 onPressed: () {
                //                   setState(() {
                //                     removeAndSave(index, list_old_word);
                //                   });
                //                 },
                //                 icon: Icon(Icons.delete,
                //                     color: Colors.red, size: 32)),
                //           ),
                //         );
                //       }),
                // ),
                RadioListTile(
                  title: Text("Nam"),
                  value: "minhquang",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Nữ"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                Container(
                  child: ElevatedButton(
                    child: Text("Nhấn để phát"),
                    onPressed: () {
                      speak(textEditingController.text);
                      setState(() {
                        bool isAdd = checkBeforeAdd(
                            textEditingController.text, list_old_word);
                        if (isAdd) {
                          addAndSave(textEditingController.text, list_old_word);
                        }
                      });
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
}
