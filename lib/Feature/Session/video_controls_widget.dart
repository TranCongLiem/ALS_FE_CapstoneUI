import 'dart:async';

import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';

class VideoControlsWidget extends StatefulWidget {
  final Exericse exercise;
  final VoidCallback onRewindVideo;
  final VoidCallback onNextVideo;
  final ValueChanged<bool> onTogglePlaying;
  final bool isPlaying;
  final bool hasPrev;
  final bool hasNext;
  final Duration duration;

  const VideoControlsWidget({
    required this.hasPrev,
    required this.hasNext,
    required this.exercise,
    required this.onRewindVideo,
    required this.onNextVideo,
    required this.onTogglePlaying,
    required this.isPlaying,
    required this.duration,
  });

  @override
  State<VideoControlsWidget> createState() => _VideoControlsWidgetState();
}

class _VideoControlsWidgetState extends State<VideoControlsWidget> {
  // Duration duration = Duration();
  // Timer? timer;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   startTimer();
  //   // currentExercise = widget.details.first.exercise;
  // }

  // void addTime() {
  //   final addSeconds = 1;

  //   setState(() {
  //     final seconds = duration.inSeconds + addSeconds;

  //     duration = Duration(seconds: seconds);
  //   });
  // }

  // void startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  // }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(widget.duration.inMinutes.remainder(60));
    final seconds = twoDigits(widget.duration.inSeconds.remainder(60));
    final hours = twoDigits(widget.duration.inHours.remainder(60));
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.95),
      ),
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     buildText(
          //       title: 'Duration',
          //       value: '${exercise.duration.inSeconds} Seconds',
          //     ),
          //     buildText(
          //       title: 'Reps',
          //       value: '${exercise.noOfReps} times',
          //     ),
          //   ],
          // ),
          buildButtons(context),
          Text(
            '$hours:$minutes:$seconds',
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }

  Widget buildText({
    required String title,
    required String value,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            widget.hasPrev
                ? IconButton(
                    icon: Icon(
                      Icons.fast_rewind,
                      color: Colors.black87,
                      size: 40,
                    ),
                    onPressed: widget.onRewindVideo,
                  )
                : SizedBox(width: 40, height: 0),
            buildPlayButton(context),
            widget.hasNext
                ? IconButton(
                    icon: Icon(
                      Icons.fast_forward,
                      color: Colors.black87,
                      size: 40,
                    ),
                    onPressed: widget.onNextVideo,
                  )
                : SizedBox(width: 40, height: 0),
          ],
        );
      });

  Widget buildPlayButton(BuildContext context) {
    final isLoading = widget.exercise.controller == null ||
        !widget.exercise.controller!.value.isReady;

    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (widget.isPlaying) {
      return buildButton(
        context,
        icon: Icon(Icons.pause, size: 40, color: Colors.white),
        onClicked: () => widget.onTogglePlaying(false),
      );
    } else {
      return buildButton(
        context,
        icon: Icon(Icons.play_arrow, size: 40, color: Colors.white),
        onClicked: () => widget.onTogglePlaying(true),
      );
    }
  }

  Widget buildButton(
    BuildContext context, {
    required Widget icon,
    required VoidCallback onClicked,
  }) =>
      GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFFff6369),
                blurRadius: 8,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Color(0xFFff6369),
            child: icon,
          ),
        ),
      );
}
