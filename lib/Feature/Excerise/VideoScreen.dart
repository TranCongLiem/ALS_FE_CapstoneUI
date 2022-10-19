import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  String dataSource =
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4';
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(dataSource)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: greenALS,
          title: Text('Video'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : Center(
                      child: Text('Đang tải...'),
                    ),
              VideoProgressIndicator(controller, allowScrubbing: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_previous_rounded, size: 50.0),
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        controller.value.isPlaying
                            ? controller.pause()
                            : controller.play();
                      });
                    },
                    // icon: Icon(Icons.play_arrow),
                    icon: controller.value.isPlaying
                        ? Icon(
                            Icons.pause,
                            size: 50.0,
                          )
                        : Icon(Icons.play_arrow, size: 50.0),
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.skip_next_rounded, size: 50.0),
                    color: Colors.black54,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
                child: Text(
                  'Bài tập này là về tay. Hãy tập theo',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w300),
                ),
              )
            ],
          ),
        ));
  }
}
