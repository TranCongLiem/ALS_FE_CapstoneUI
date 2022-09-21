import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../../Home/view/home_view.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeView(),
    );
  }
}
