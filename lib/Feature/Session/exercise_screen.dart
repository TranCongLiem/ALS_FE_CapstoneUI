import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseVideoScreen extends StatefulWidget {
  const ExerciseVideoScreen({
    Key? key,
    required this.exercise,
    required this.onInitialized,
    required this.setIsPlaying,
  }) : super(key: key);
  final Exericse exercise;
  final VoidCallback onInitialized;
  final VoidCallback setIsPlaying;

  @override
  State<ExerciseVideoScreen> createState() => _ExerciseVideoScreenState();
}

class _ExerciseVideoScreenState extends State<ExerciseVideoScreen> {
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
    videoID = YoutubePlayer.convertUrlToId(widget.exercise.VideoLink ?? '');
    controller = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        isLive: false,
      ),
    );
    // if (controller.value.isReady) {
    //   widget.exercise.controller = controller;
    //   widget.onInitialized();
    // }
    // widget.exercise.controller = controller;
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
        onReady: () {
          widget.exercise.controller = controller;

          //widget.onInitialized();
          widget.setIsPlaying();
        },
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(widget.exercise.ExerciseName!),
            centerTitle: true,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: 18.0, bottom: 18.0, left: 10.0),
                  child: Text(
                    widget.exercise.ExerciseName ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 10.0),
                  child: Text(
                    widget.exercise.Description ?? '',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 26.0,
                        fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
