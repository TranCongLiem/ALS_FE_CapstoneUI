import 'dart:math';
import 'package:capstone_ui/Bloc/categoryExercise/category_exercise_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/CategoryExercise/CustomCategoryList.dart';
import 'package:capstone_ui/Feature/Excerise/session_exercise.dart';
import 'package:capstone_ui/services/api_CategoryExercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../Components/BottomNavBar/bottom_nav_bar.dart';

class ListExcerise extends StatefulWidget {
  const ListExcerise({Key? key}) : super(key: key);

  @override
  State<ListExcerise> createState() => _ListExceriseState();
}

class _ListExceriseState extends State<ListExcerise> {
  String outputText = 'Tìm kiếm';
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  String _currentLocaleId = 'vi_VN';
  var categoriesOfExercise;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  double level = 0.0;

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CategoryExerciseBlocBloc(
                  RepositoryProvider.of<CategoryExerciseService>(context))
                ..add(LoadCategoryExerciseEvent())),
        ],
        child: Scaffold(
          bottomNavigationBar: MyBottomNavBar(
              // ignore: unnecessary_this
              // index: this.index,
              ),
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: greenALS,
            title: Text(
              'Bài tập',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //search bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: size.height / 15,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(22)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 24),
                            ),
                            Expanded(
                                child: TextField(
                              decoration: InputDecoration(
                                  hintText: outputText,
                                  border: InputBorder.none,
                                  suffixIcon: Icon(Icons.search),
                                  hintStyle: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500)),
                            )),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: .26,
                                        spreadRadius: level * 1.5,
                                        color: greenALS.withOpacity(.1))
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              child: ElevatedButton(
                                onPressed: () {
                                  !_hasSpeech || speech.isListening
                                      ? null
                                      : startListening();
                                },
                                // ignore: sort_child_properties_last
                                child: Icon(Icons.mic,
                                    color: speech.isListening
                                        ? Colors.red
                                        : Colors.white,
                                    size: 25),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(7.0),
                                  primary: greenALS, // <-- Button color
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),

                WidgetEx2(), //Phan Loai/Xem tat ca

                Expanded(
                  child: BlocBuilder<CategoryExerciseBlocBloc,
                      CategoryExerciseBlocState>(builder: (context, state) {
                    if (state is CategoryExerciseLoadedState) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          scrollDirection: Axis.vertical,
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return CustomCategoryList(
                                state.list[index], context);
                          });
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                ),
              ],
            ),
          ),
        ));

    ;
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  void statusListener(String status) {
    print(status);
  }

  void errorListener(SpeechRecognitionError errorNotification) {}

  startListening() async {
    PermissionStatus microStatus = await Permission.microphone.request();
    if (microStatus == PermissionStatus.granted) {}
    if (microStatus == PermissionStatus.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cần có quyền truy cập vào micro')));
    }
    if (microStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 4),
        partialResults: true,
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
  }

  void resultListener(SpeechRecognitionResult result) {
    if (result.finalResult)
      setState(() {
        outputText = result.recognizedWords;
      });
  }

  soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    setState(() {
      this.level = level;
    });
  }
}

class WidgetEx2 extends StatelessWidget {
  const WidgetEx2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Phân loại',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            'Xem tất cả',
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
