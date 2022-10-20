import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  const Video({super.key});

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
    String videoID;
    videoID = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=q1xLwFUZ_Hc")!;
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
        controller: controller!,
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
                  'Bài tập này là về tay. Hãy tập theo ',
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
                  'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
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
