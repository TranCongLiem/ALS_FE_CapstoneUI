// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:audioplayers/audioplayers.dart';
// import 'package:capstone_ui/Feature/News/voice_connection.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class PlayerWidget extends StatefulWidget {
//   final AudioPlayer player;
//
//   const PlayerWidget({
//     Key? key,
//     required this.player,
//   }) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _PlayerWidgetState();
//   }
// }
//
// class _PlayerWidgetState extends State<PlayerWidget> {
//   PlayerState? _audioPlayerState;
//   Duration? _duration;
//   Duration? _position;
//
//   PlayerState _playerState = PlayerState.stopped;
//   StreamSubscription? _durationSubscription;
//   StreamSubscription? _positionSubscription;
//   StreamSubscription? _playerCompleteSubscription;
//   StreamSubscription? _playerStateChangeSubscription;
//
//   bool get _isPlaying => _playerState == PlayerState.playing;
//   bool get _isPaused => _playerState == PlayerState.paused;
//   String get _durationText => _duration?.toString().split('.').first ?? '';
//   String get _positionText => _position?.toString().split('.').first ?? '';
//
//   AudioPlayer get player => widget.player;
//
//   @override
//   void initState() {
//     super.initState();
//     _initStreams();
//   }
//
//   @override
//   void setState(VoidCallback fn) {
//     // Subscriptions only can be closed asynchronously,
//     // therefore events can occur after widget has been disposed.
//     if (mounted) {
//       super.setState(fn);
//     }
//   }
//
//   @override
//   void dispose() {
//     _durationSubscription?.cancel();
//     _positionSubscription?.cancel();
//     _playerCompleteSubscription?.cancel();
//     _playerStateChangeSubscription?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         SizedBox(
//           height: 60.0,
//           width: 60.0,
//           child: CircularProgressIndicator(
//             backgroundColor: Colors.black,
//             strokeWidth: 4.0,
//             valueColor: AlwaysStoppedAnimation(Colors.greenAccent),
//             value: (_position != null && _duration != null && _position!.inMilliseconds >0 && _position!.inMilliseconds < _duration!.inMilliseconds) ? _position!.inMilliseconds / _duration!.inMilliseconds :0.0,
//           ),
//         ),
//         IconButton(
//             onPressed: (){
//               _isPlaying ? _pause() : _play();
//             },
//             icon: _isPlaying ? Icon(Icons.pause) : Icon(Icons.play_arrow),
//         )
//       ],
//     );
//   }
//
//   void _initStreams() {
//     _durationSubscription = player.onDurationChanged.listen((duration) {
//       setState(() => _duration = duration);
//     });
//
//     _positionSubscription = player.onPositionChanged.listen(
//           (p) => setState(() => _position = p),
//     );
//
//     _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
//       player.stop();
//       setState(() {
//         _playerState = PlayerState.stopped;
//         _position = _duration;
//       });
//     });
//
//     _playerStateChangeSubscription =
//         player.onPlayerStateChanged.listen((state) {
//           setState(() {
//             _audioPlayerState = state;
//           });
//         });
//   }
//
//   Future<void> _play(String body) async {
//     var response= voiceResponse(body);
//     var jsonData= jsonDecode(response.body);
//     String audioBase64= jsonData['audioContent'];
//     Uint8List bytes= base64Decode(audioBase64);
//     String dir= (await getApplicationDocumentsDirectory()).path;
//     File file= File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".mp3");
//     await file.writeAsBytes(bytes);
//
//     final position = _position;
//     if (position != null && position.inMilliseconds > 0) {
//       await player.seek(position);
//     }
//
//     await player.resume();
//     setState(() => _playerState = PlayerState.playing);
//   }
//
//   Future<void> _pause() async {
//     await player.pause();
//     setState(() => _playerState = PlayerState.paused);
//   }
//
//   Future<void> _stop() async {
//     await player.stop();
//     setState(() {
//       _playerState = PlayerState.stopped;
//       _position = Duration.zero;
//     });
//   }
// }