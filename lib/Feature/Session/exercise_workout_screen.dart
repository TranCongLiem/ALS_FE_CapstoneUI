import 'dart:async';

import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/Session/exercise_screen.dart';
import 'package:capstone_ui/Feature/Session/video_controls_widget.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/Model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseWorkoutScreen extends StatefulWidget {
  const ExerciseWorkoutScreen({
    super.key,
    required this.exercise,
  });

  final Exericse exercise;

  @override
  State<ExerciseWorkoutScreen> createState() => _ExerciseWorkoutScreenState();
}

class _ExerciseWorkoutScreenState extends State<ExerciseWorkoutScreen> {
  final _pageController = PageController();
  // Exericse? currentExercise;
  bool _isPlaying = true;
  Duration duration = Duration();
  int? currentIndex;
  int? lastIndex;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
    // currentExercise = widget.details.first.exercise;
  }

  void addTime() {
    final addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          buildVideos(),
          Positioned(
            bottom: 20,
            right: 50,
            left: 50,
            child: Column(
              children: [
                buildVideoControls(),
                ElevatedButton(
                  onPressed: () {
                    List<CreateSessionRequestExercise> list = [];
                    CreateSessionRequestExercise temp =
                        CreateSessionRequestExercise(
                            exerciseId: widget.exercise.ExericseID);
                    list.add(temp);
                    context.read<SessionBloc>().add(SessionEvent.endSession(
                          list,
                          context.read<AuthenticateBloc>().state.userId,
                        ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListExcerise()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: greenALS,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 15.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Kết thúc tập',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildVideos() =>
      // PageView(
      //       controller: _pageController,
      //       onPageChanged: (index) => setState(() {
      //         // currentExercise = widget.details[index].exercise;
      //       }),
      //       children:
      ExerciseVideoScreen(
        exercise: widget.exercise,
        onInitialized: () => setState(() {}),
        setIsPlaying: () {
          setState(() {
            _isPlaying = true;
          });
        },
      );
  //           );
  // );

  Widget buildVideoControls() => VideoControlsWidget(
        duration: duration,
        exercise: widget.exercise,
        hasNext: false,
        hasPrev: false,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              widget.exercise.controller!.play();
              _isPlaying = true;
            } else {
              widget.exercise.controller!.pause();
              _isPlaying = false;
            }
          });
        },
        onNextVideo: () => _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        onRewindVideo: () => _pageController.previousPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        ),
        isPlaying: _isPlaying,
      );
}
