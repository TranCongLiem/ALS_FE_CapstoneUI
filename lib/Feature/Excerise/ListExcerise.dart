import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:flutter/material.dart';
import 'DetailExcerise.dart';

class ListExcerise extends StatefulWidget {
  const ListExcerise({Key? key}) : super(key: key);

  @override
  State<ListExcerise> createState() => _ListExceriseState();
}

class _ListExceriseState extends State<ListExcerise> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bài tập'),
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
                              hintText: 'Tìm kiếm', border: InputBorder.none),
                        ))
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Gợi ý',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoScreen()));
                    },
                    child: Text('Chi tiết')),
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

// Widget buildCardRecommend() => Expanded(
//         child: Container(
//       height: 200,
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.green[50],
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         children: [
//           Image.asset(
//             'assets/images/logo_ALS.png',
//             width: 200,
//           ),
//         ],
//       ),
//     ));

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
