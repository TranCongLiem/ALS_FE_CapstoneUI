import 'package:capstone_ui/Components/Feature/Excerise/category_recommend.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Feature/Excerise/voice_to_text_search.dart';
import 'package:flutter/material.dart';

import '../../Components/BottomNavBar/bottom_nav_bar.dart';
import 'DetailExcerise.dart';

class ListExcerise extends StatefulWidget {
  const ListExcerise({Key? key}) : super(key: key);

  @override
  State<ListExcerise> createState() => _ListExceriseState();
}

class _ListExceriseState extends State<ListExcerise> {
  int index = 3;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        // ignore: unnecessary_this
        index: this.index,
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: greenALS,
        title: Text(
          'Bài tập',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Column(
          children: [
            //search bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            ),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm',
                            border: InputBorder.none,
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  child: Image.asset(
                                    "assets/images/logo_ALS.png",
                                    height: 20,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                                // _buildVoiceInput(
                                //   onPressed: _speechRecognitionAvailable &&
                                //           !_isListening
                                //       ? () => start()
                                //       : () => stop(),
                                //   label: _isListening
                                //       ? S.of(context).listening
                                //       : '',
                                // ),
                              ],
                            ),
                          ),
                        )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          VoiceToTextSearch()));
                            },
                            icon: Icon(Icons.mic))
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VideoScreen()));
                  },
                  label: Text(
                    'Tạo buổi tập',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icon(Icons.add),
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    elevation: MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed) ||
                          (states.contains(MaterialState.disabled))) {
                        return 0;
                      }
                      return 5;
                    }),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Lịch sử luyện tập',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),

            Container(
                padding: const EdgeInsets.only(top: 15),
                height: size.height / 3,
                width: size.width / 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardRecommend(),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Phân loại',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: const EdgeInsets.only(top: 15),
                height: size.height / 4,
                width: size.width / 1,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                    buildCardCategory(),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

// Widget  buildCardRecommend() => Expanded(
//   child: Container(
//     height: 100,
//     width: 200,
//     decoration: BoxDecoration(
//       color: Colors.green[50],
//       borderRadius: BorderRadius.circular(10),
//   ),
//     child: Column(
//       children: [
//         Image.asset('assets/images/logo_ALS.png', width: 200,),
//       ],
//     ),
// )
// );

Widget buildCardRecommend() => Expanded(
        child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/logo_ALS.png',
            width: 200,
          ),
        ],
      ),
    ));

Widget buildCardCategory() => Expanded(
        child: Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/baitap_tay.png',
            width: 300,
          ),
        ],
      ),
    ));
