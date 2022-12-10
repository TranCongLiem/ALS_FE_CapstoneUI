import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Feature/Session/exercise_workout_screen.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  const Video({Key? key, required this.exericse}) : super(key: key);
  final Exericse exericse;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController controller;
  bool _muted = false;
  bool _isPlayerReady = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var videoID;
    // videoID = YoutubePlayer.convertUrlToId(
    //     "https://www.youtube.com/watch?v=q1xLwFUZ_Hc")!;
    videoID = YoutubePlayer.convertUrlToId(widget.exericse.VideoLink ?? '');
    controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: ProgressBarColors(
            playedColor: Colors.red, handleColor: Colors.redAccent),
      ),
      builder: (context, player) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: Text('Video'),
            backgroundColor: Color(0xffffff),
            elevation: 0,
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              player,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                    onPressed: _isPlayerReady
                        ? () {
                            _muted ? controller.unMute() : controller.mute();
                            setState(() {
                              _muted = !_muted;
                            });
                          }
                        : null,
                  ),
                  FullScreenButton(
                    controller: controller,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
              Text(
                widget.exericse.ExerciseName ?? '',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              Divider(
                color: Colors.black26,
              ),
              Text(
                widget.exericse.Description ?? '',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w300),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ExerciseWorkoutScreen(
              //                 exercise: widget.exericse)));
              //   },
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.blue[300],
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     elevation: 15.0,
              //   ),
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: Text(
              //       'Bắt đầu tập',
              //       style: TextStyle(fontSize: 20),
              //     ),
              //   ),
              // ),
            ],
          )),
          floatingActionButton: Container(
            width: MediaQuery.of(context).size.width / 2,
            // alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                context.read<SessionBloc>().add(SessionEvent.startSession());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ExerciseWorkoutScreen(exercise: widget.exericse)));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 15.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Bắt đầu tập',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          // label: Text(
          //   'Bắt đầu tập',
          //   style: TextStyle(fontSize: 20),
          // ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          // bottomSheet: Container(
          //   width: MediaQuery.of(context).size.width,
          //   // alignment: Alignment.center,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>
          //                   ExerciseWorkoutScreen(exercise: widget.exericse)));
          //     },
          //     style: ElevatedButton.styleFrom(
          //       primary: Colors.blue[300],
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(25),
          //       ),
          //       elevation: 15.0,
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(20.0),
          //       child: Text(
          //         'Bắt đầu tập',
          //         style: TextStyle(fontSize: 20),
          //       ),
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
