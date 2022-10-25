import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/constant.dart';

Widget CustomRecordList(
    RecordById recordById, BuildContext context, int? selectedIndex) {
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    elevation: 5,
    
    child: Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Ink.image(
                height: 100,
                width: 100,
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {},
                ),
                image: NetworkImage(
                    'https://cdn1.iconfinder.com/data/icons/video-production-butterscotch-vol-2/256/Microphone-512.png')),
            ElevatedButton.icon(
                onPressed: () {
                  _onListTileButtonPressed(recordById,selectedIndex);
                },
                icon: selectedIndex == 1
                    ? Icon(Icons.pause, size: 80.0)
                    : Icon(
                        Icons.play_circle,
                        size: 80.0,
                      ),
                label: Text(''),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.only(left: 7),
                  backgroundColor: greenALS,
                ))
          ],
        ),
        Text(
          recordById.recordName ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20.0,
          ),
        )
      ],
    ),
  );
}

Future<void> _onListTileButtonPressed(RecordById recordById, int? selectedIndex) async {
  late AudioPlayer audioPlayer;
  audioPlayer = AudioPlayer();

  Reference pathReference = FirebaseStorage.instance
      .ref()
      .child('upload-voice-firebase')
      .child(recordById.linkAudio ?? '');
  audioPlayer.play(await pathReference.getDownloadURL(), isLocal: false);
  audioPlayer.onPlayerCompletion.listen((duration) {
      selectedIndex = -1;
  });
}
