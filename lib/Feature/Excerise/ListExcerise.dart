import 'dart:math';

import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/categoryExercise/category_exercise_bloc.dart';
import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Components/Feature/Excerise/Excerise/category_ex.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/CategoryExercise/CustomCategoryList.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Feature/Session/session_detail_screen.dart';
import 'package:capstone_ui/Feature/Session/session_exercise.dart';
import 'package:capstone_ui/Bloc/exercise/exercise_bloc_bloc.dart';
import 'package:capstone_ui/Feature/Session/sessions_screen.dart';
import 'package:capstone_ui/Feature/TextToSpeech/TextToSpeech.dart';
import 'package:capstone_ui/Model/session_model.dart';
import 'package:capstone_ui/services/api_CategoryExercise.dart';
import 'package:capstone_ui/services/api_Exercise.dart';
import 'package:capstone_ui/services/api_Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../Components/BottomNavBar/bottom_nav_bar.dart';
import 'view_all_exercise.dart';

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
    context.read<SessionBloc>().add(SessionEvent.getSessionHistory(
        context.read<AuthenticateBloc>().state.userId));
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
          body: Column(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonCreateEx(),
                  SizedBox(
                    width: 5,
                  ),
                  GetSessionsButton(),
                ],
              ),

              WidgetEx1(),
              // Container(
              //     padding: const EdgeInsets.only(top: 15),
              //     height: size.height / 4,
              //     width: size.width / 1,
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: [
              //         buildCardRecommend(),
              //         SizedBox(
              //           width: 12,
              //         ),
              //         buildCardRecommend(),
              //         SizedBox(
              //           width: 12,
              //         ),
              //         buildCardRecommend(),
              //         SizedBox(
              //           width: 12,
              //         ),
              //       ],
              //     )),
              Expanded(
                child: BlocBuilder<SessionBloc, SessionState>(
                    builder: (context, state) {
                  print('abc' + state.toString());
                  if (state.history != null) {
                    print('Print ExState');

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.history!.length,
                      itemBuilder: (context, index) {
                        // setState(() {
                        //   categoriesOfExercise=state.list;
                        // });
                        return buildCardHistory(state.history![index], context);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
              WidgetEx2(), //Phan Loai/Xem tat ca

              Expanded(
                child: BlocBuilder<CategoryExerciseBlocBloc,
                    CategoryExerciseBlocState>(builder: (context, state) {
                  if (state is CategoryExerciseLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        // setState(() {
                        //   categoriesOfExercise=state.list;
                        // });
                        return CustomCategoryList(state.list[index], context);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ],
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
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Phân loại',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewAll()));
            },
            child: Text(
              'Xem tất cả',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetEx1 extends StatelessWidget {
  const WidgetEx1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Lịch sử luyện tập',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          // Text(
          //   'Xem tất cả',
          //   style: TextStyle(
          //     color: Colors.blueAccent,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ButtonCreateEx extends StatelessWidget {
  const ButtonCreateEx({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SessionExercise()));
          },
          label: Text(
            'Tạo buổi tập',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  (states.contains(MaterialState.disabled))) {
                return 0;
              }
              return 5;
            }),
          ),
        ),
      ),
    );
  }
}

// class ButtonGetSession extends StatelessWidget {
//   const ButtonGetSession({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SessionBloc, SessionState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
//             builder: (context, state) {
//               return Container(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     context
//                         .read<SessionBloc>()
//                         .add(SessionEvent.getSessionsByUserId(state.userId));
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SessionExercise()));
//                   },
//                   child: Text(
//                     'Buổi tập của bạn',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   //icon: Icon(Icons.add),
//                   style: ButtonStyle(
//                     foregroundColor:
//                         MaterialStateProperty.all<Color>(Colors.white),
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Color.fromARGB(255, 14, 106, 211)),
//                     elevation: MaterialStateProperty.resolveWith<double>(
//                         (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed) ||
//                           (states.contains(MaterialState.disabled))) {
//                         return 0;
//                       }
//                       return 5;
//                     }),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class GetSessionsButton extends StatelessWidget {
  const GetSessionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AuthenticateBloc, AuthenticateState>(
            builder: (context, state) {
              return Container(
                child: ElevatedButton(
                  child: Text(
                    "Buổi tập của bạn",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 14, 106, 211),
                    ),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed) ||
                            states.contains(MaterialState.disabled)) {
                          return 0;
                        }
                        return 5;
                      },
                    ),
                  ),
                  onPressed: () {
                    context
                        .read<SessionBloc>()
                        .add(SessionEvent.getSessionsByUserId(state.userId));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SessionsScreen()));
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// Widget buildCardHistory(
//   GetSessionHistoryResponseModel history,
//   BuildContext context,
// ) =>
//     Expanded(
//         child: Container(
//       padding: new EdgeInsets.only(
//         left: 12,
//         right: 12,
//       ),
//       height: 100,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.green[50],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Text("Tên buổi tập"),
//         ],
//       ),
//     ));
Widget buildCardHistory(
  GetSessionHistoryResponseModel history,
  BuildContext context,
) =>
    Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          //vertical: 20 / 2,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(color: Color.fromARGB(255, 199, 247, 201),
              //borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10.0,
                    offset: Offset(5, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {
                // // context.read<SessionBloc>().add(
                // //     SessionEvent.getSessionDetailRequested(
                // //         state.sessions[index].sessionId));
                // var details =
                //     state.detailsList![state.sessions[index].sessionId];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SessionDetail(details: history.sessionDetail!)));
              },
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20 / 2, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tên Buổi Tập",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                //state.details!.length.toString() + ' exercises',
                                history.sessionDetail!.length.toString() +
                                    " Bài tập",
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            "Kết thúc vào ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat.yMd()
                                .format(history.endTime!.toLocal())
                                .toString(),
                          ),
                          Text(
                            DateFormat.jm()
                                .format(history.endTime!.toLocal())
                                .toString(),
                          ),
                          // Text(
                          //   DateFormat.jm()
                          //       .format(history.startTime!.toLocal())
                          //       .toString(),
                          // ),
                          // Text(
                          //   DateFormat.jm()
                          //       .parse(DateFormat.jm().format(history.endTime!))
                          //       .difference(DateFormat.jm().parse(
                          //           DateFormat.jm().format(history.startTime!)))
                          //       .toString(),
                          // ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            "Thời lượng ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            history.endTime!
                                    .difference(history.startTime!)
                                    .inHours
                                    .toString()
                                    .padLeft(2, "0") +
                                ":" +
                                history.endTime!
                                    .difference(history.startTime!)
                                    .inMinutes
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, "0") +
                                ":" +
                                history.endTime!
                                    .difference(history.startTime!)
                                    .inSeconds
                                    .remainder(60)
                                    .toString()
                                    .padLeft(2, "0"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );

class SpeechStatusWidget extends StatelessWidget {
  const SpeechStatusWidget({
    Key? key,
    required this.speech,
  }) : super(key: key);
  final SpeechToText speech;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Center(
            child: speech.isListening
                ? Text(
                    "Đang nghe...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.white),
                  )
                : Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ),
        ],
      ),
    );
  }
}
