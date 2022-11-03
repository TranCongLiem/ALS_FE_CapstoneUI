// import 'package:capstone_ui/Constant/constant.dart';
// import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({Key? key, required this.exericse}) : super(key: key);
//   final Exericse exericse;

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   // String dataSource =
//   //     'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';
//   var dataSource;
//   late VideoPlayerController controller;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     dataSource=widget.exericse.VideoLink;
//     controller = VideoPlayerController.network(dataSource)
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: greenALS,
//           title: Text('Video'),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 controller.value.isInitialized
//                     ? AspectRatio(
//                         aspectRatio: controller.value.aspectRatio,
//                         child: VideoPlayer(controller),
//                       )
//                     : Center(
//                         child: Text('Đang tải...'),
//                       ),
//                 VideoProgressIndicator(controller, allowScrubbing: true),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.skip_previous_rounded, size: 50.0),
//                       color: Colors.black54,
//                     ),
//                     SizedBox(
//                       width: 20.0,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           controller.value.isPlaying
//                               ? controller.pause()
//                               : controller.play();
//                         });
//                       },
//                       // icon: Icon(Icons.play_arrow),
//                       icon: controller.value.isPlaying
//                           ? Icon(
//                               Icons.pause,
//                               size: 50.0,
//                             )
//                           : Icon(Icons.play_arrow, size: 50.0),
//                       color: Colors.black54,
//                     ),
//                     SizedBox(
//                       width: 20.0,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.skip_next_rounded, size: 50.0),
//                       color: Colors.black54,
//                     )
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
//                   child: Text(
//                     widget.exericse.ExerciseName ?? '',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 30.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 18.0),
//                   child: Text(
//                     widget.exericse.Description ?? '',
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 26.0,
//                         fontWeight: FontWeight.w300),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ));
//   }
// }

//-----//bug link youttube

import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
                  // IconButton(
                  //   icon: const Icon(Icons.skip_previous),
                  //   // onPressed: _isPlayerReady
                  //   //     ? () => controller.load(_ids[
                  //   //         (_ids.indexOf(controller.metadata.videoId) -
                  //   //                 1) %
                  //   //             _ids.length])
                  //   //     : null,
                  //   onPressed: () {},
                  // ),
                  // IconButton(
                  //   icon: Icon(
                  //     controller.value.isPlaying
                  //         ? Icons.play_arrow
                  //         : Icons.pause,
                  //   ),
                  //   onPressed: () {
                  //     setState(() {
                  //       controller.value.isPlaying
                  //           ? controller.pause()
                  //           : controller.play();
                  //     });
                  //   },
                  // ),
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
                  // IconButton(
                  //   icon: const Icon(Icons.skip_next),
                  //   // onPressed: _isPlayerReady
                  //   //     ? () => controller.load(_ids[
                  //   //         (_ids.indexOf(controller.metadata.videoId) +
                  //   //                 1) %
                  //   //             _ids.length])
                  //   //     : null,
                  //   onPressed: () {},
                  // ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 18.0, bottom: 18.0, left: 10.0),
                child: Text(
                  widget.exericse.ExerciseName ?? '',
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
                  widget.exericse.Description ?? '',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          )),
        );
      },
    );
  }
}
