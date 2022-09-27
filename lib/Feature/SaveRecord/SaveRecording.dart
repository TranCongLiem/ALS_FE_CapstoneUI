import 'package:capstone_ui/Constant/constant.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:request_permission/request_permission.dart';
import 'cloud_record_list_view.dart';
import 'feature_buttons_view.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {
  List<Reference> references = [];
  RequestPermission requestPermission = RequestPermission.instace;
  @override
  void initState() {
    super.initState();
    _onUploadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hỗ trợ ghi âm'),
          centerTitle: true,
          backgroundColor: greenALS,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: references.isEmpty
                  ? Center(
                      child: Text('Chưa có bản ghi âm nào'),
                    )
                  : CloudRecordListView(
                      references: references,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  requestPermission.requestAndroidPermission(
                      "android.permission.RECORD_AUDIO");
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(greenALS)),
                child: FeatureButtonsView(
                  onUploadComplete: _onUploadComplete,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();
    setState(() {
      references = listResult.items;
    });
  }
}
