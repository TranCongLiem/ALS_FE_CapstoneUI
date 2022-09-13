import 'package:flutter/material.dart';

import '../../Components/Home/category_card.dart';
import '../../Constant/constant.dart';

class SaveRecording extends StatefulWidget {
  const SaveRecording({Key? key}) : super(key: key);

  @override
  State<SaveRecording> createState() => _SaveRecordingState();
}

class _SaveRecordingState extends State<SaveRecording> {
  @override
  Widget build(BuildContext context) {
    var size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/anh_web.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: .85,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          children: <Widget>[
                            CategoryCard(
                              title: "",
                              svgSrc: 'assets/icons/text.svg',
                              press: () {}
                            ),
                            CategoryCard(
                              title: "",
                              svgSrc: 'assets/icons/microphone.svg',
                              press: () {
                                 },
                            ),
                            CategoryCard(
                              title: "",
                              svgSrc: "assets/icons/saverecord1.svg",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "",
                              svgSrc: "assets/icons/ex1.svg",
                              press: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}