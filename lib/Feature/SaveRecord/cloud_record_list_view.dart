import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Bloc/record/record_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/Category_List_Record/custom_record_list.exercise.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'catalog.dart';

class CloudRecordListView extends StatefulWidget {
  //final List<Reference> references;
  final List<RecordById> references;
  const CloudRecordListView({
    Key? key,
    required this.references,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  var list_tes = [
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc',
    '/upload-voice-firebase/1663767506989.acc'
  ];

  late bool isPlaying;
  late AudioPlayer audioPlayer;
  int? selectedIndex;
  @override
  void initState() {
    super.initState();
    isPlaying = false;
    audioPlayer = AudioPlayer();
    selectedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.25 / 3),
            scrollDirection: Axis.horizontal,
            itemCount: widget.references.length,
            itemBuilder: (BuildContext context, int index) {
              //return CustomRecordList(widget.references[index], context , selectedIndex);
              return Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
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
                              _onListTileButtonPressed(
                                  widget.references[index], index);
                            },
                            icon: selectedIndex == index
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
                      widget.references[index].recordName ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              );
            }));
  }

  Future<void> _onListTileButtonPressed(
      RecordById recordById, int index) async {
    // await audioPlayer.stop();
    setState(() {
      selectedIndex = index;
      isPlaying = true;
    });
    Reference pathReference = FirebaseStorage.instance
        .ref()
        .child('upload-voice-firebase')
        .child(recordById.linkAudio ?? '');
    audioPlayer.stop();
    audioPlayer.play(await pathReference.getDownloadURL(), isLocal: false);
    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        isPlaying = false;
        selectedIndex = -1;
      });
    });
  }
}
