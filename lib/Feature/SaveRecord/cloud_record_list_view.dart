import 'package:audioplayers/audioplayers.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'catalog.dart';

class CloudRecordListView extends StatefulWidget {
  final List<Reference> references;
  const CloudRecordListView({
    Key? key,
    required this.references,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CloudRecordListViewState createState() => _CloudRecordListViewState();
}

class _CloudRecordListViewState extends State<CloudRecordListView> {
  // List<String> images = [
  //   "assets/images/logo_ALS.png",
  //   "assets/images/logo_Avatar.jpg",
  //   "assets/images/logoALS1.png",
  //   "assets/images/role-patient.png",
  // ];

  bool? isPlaying;
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
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: widget.references.length,
        reverse: true,
        primary: false,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 2,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://image.shutterstock.com/image-vector/little-boy-happy-eat-breakfast-260nw-586610600.jpg"),
              ),
              title: Text(widget.references.elementAt(index).name),
              trailing: IconButton(
                icon: selectedIndex == index
                    ? Icon(Icons.pause)
                    : Icon(Icons.play_circle),
                onPressed: () => _onListTileButtonPressed(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _onListTileButtonPressed(int index) async {
    setState(() {
      selectedIndex = index;
    });
    audioPlayer.play(await widget.references.elementAt(index).getDownloadURL(),
        isLocal: false);

    audioPlayer.onPlayerCompletion.listen((duration) {
      setState(() {
        selectedIndex = -1;
      });
    });
  }
}
