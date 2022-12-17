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

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({
    super.key,
    required this.details,
  });

  final List<GetSessionDetailResponseModel> details;

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final _pageController = PageController();
  Exericse? currentExercise;
  int? currentIndex;
  int? lastIndex;
  bool _isPlaying = true;
  bool _hasPrevious = true;
  bool _hasNext = true;
  Duration duration = Duration();
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    currentExercise = widget.details.first.exercise;
    lastIndex = widget.details.length - 1;
    currentIndex = 0;
    startTimer();
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
                    for (var detail in widget.details) {
                      CreateSessionRequestExercise temp =
                          CreateSessionRequestExercise(
                              exerciseId: detail.exerciseId);
                      list.add(temp);
                    }
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
                      'Kết thúc buổi tập',
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

  Widget buildVideos() => PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() {
          currentExercise = widget.details[index].exercise;
          currentIndex = index;
          // _hasPrevious = currentIndex! < lastIndex!;
        }),
        children: widget.details
            .map((detail) => ExerciseVideoScreen(
                  exercise: detail.exercise!,
                  onInitialized: () => setState(() {}),
                  setIsPlaying: () {
                    setState(() {
                      _isPlaying = true;
                    });
                  },
                ))
            .toList(),
      );

  Widget buildVideoControls() => VideoControlsWidget(
        duration: duration,
        exercise: currentExercise!,
        hasNext: currentIndex! < lastIndex!,
        hasPrev: currentIndex! > 0,
        onTogglePlaying: (isPlaying) {
          setState(() {
            if (isPlaying) {
              currentExercise!.controller!.play();
              _isPlaying = true;
            } else {
              currentExercise!.controller!.pause();
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
