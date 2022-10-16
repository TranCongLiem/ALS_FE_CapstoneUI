import 'dart:convert';

import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

import '../../Components/BottomNavBar/bottom_nav_bar.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({super.key});

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: greenALS,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: greenALS,
            title: Text(
              'Bảng tin',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: MyBottomNavBar(
            // ignore: unnecessary_this
            index: this.index,
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: SizedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.als.org/sites/default/files/styles/image_callout/public/2021-06/navigating-ALS_02-smaller.jpg?itok=hQ1BFFn0"),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(31, 165, 159, 159),
                              borderRadius: BorderRadius.circular(22)),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 30),
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Bạn đang nghĩ gì?',
                                    border: InputBorder.none),
                              )),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => CardItem(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.als.org/sites/default/files/styles/hero_image/public/2021-06/navigating-ALS_01-smaller.jpg?h=2f03dbdf&itok=6xFToT1-"),
              ),
              title: Text("Nguyễn Văn A"),
              subtitle: Text("September 22 at 12:17 PM"),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Đây là những bài tập của tôi',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.als.org/sites/default/files/styles/hero_image/public/2020-06/Hero-New-Site_08.jpg?h=be2185f4&itok=qkJVB6S9"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    Text(
                      "Thích",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
//     return Card(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8.0),
//         color: Colors.white,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   _PostHeader(post: post),
//                   const SizedBox(height: 4.0),
//                   Text(post.caption),
//                   post.imageUrl != null
//                       ? const SizedBox.shrink()
//                       : const SizedBox(height: 6.0),
//                 ],
//               ),
//             ),
//             post.imageUrl != null
//                 ? Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: CachedNetworkImage(imageUrl: post.imageUrl),
//                   )
//                 : const SizedBox.shrink(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: _PostStats(post: post),
//             ),
//           ],
//         ),
//       ),
//     );
  }
}

// class _PostHeader extends StatelessWidget {
//   // final Post post;

//   const _PostHeader({
//     required Key key,

//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ProfileAvatar(imageUrl: post.user.imageUrl),
//         const SizedBox(width: 8.0),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'post.user.name',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 children: [
//                   Text(
//                     '12h • ',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontSize: 12.0,
//                     ),
//                   ),
//                   Icon(
//                     Icons.public,
//                     color: Colors.grey[600],
//                     size: 12.0,
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _PostStats extends StatelessWidget {


//   const _PostStats({
//     required Key key, required Future<Response> Function(Uri url, {Object? body, Encoding? encoding, Map<String, String>? headers}) post,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(4.0),
//               decoration: BoxDecoration(
//                 color: greenALS,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.thumb_up,
//                 size: 10.0,
//                 color: Colors.white,
//               ),
//             ),
//             const SizedBox(width: 4.0),
//             Expanded(
//               child: Text(
//                 'Bài này là bài mẫu',
//                 style: TextStyle(
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const Divider(),
//         // _PostButton(
//         //   icon: Icon(
//         //     Icons.favorite,
//         //     color: Colors.grey[600],
//         //     size: 20.0,
//         //   ),
//         //   label: 'Like',
//         //   onTap: () {},
      
//         // ),
//       ],
//     );
//   }
// }

// class _PostButton extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final Function onTap;

//   const _PostButton({
//     required Key key,
//     required this.icon,
//     required this.label,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         color: Colors.white,
//         child: InkWell(
//           onTap: () {},
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             height: 25.0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 icon,
//                 const SizedBox(width: 4.0),
//                 Text(label),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
