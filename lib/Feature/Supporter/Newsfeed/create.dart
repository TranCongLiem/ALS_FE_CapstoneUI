// import 'dart:io';

// import 'package:capstone_ui/Constant/constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_picker/image_picker.dart';

// import 'newfeeds.dart';
// enum MediaType {
//   image,
//   video;
// }

// class Create extends StatefulWidget {
//   const Create({super.key});

//   @override
//   State<Create> createState() => _CreateState();
// }

// class _CreateState extends State<Create> {
//   String? imagePath;
//   MediaType _mediaType = MediaType.image;
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: Stack(
//           children: <Widget>[
//             Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Color(0xFF6ABF4B).withOpacity(0.7),
//                 Color(0xffd2fbd2).withOpacity(0.7),
//               ], begin: Alignment.topCenter)),
//             ),
//             SafeArea(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       IconButton(
//                           onPressed: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => NewFeed()));
//                           },
//                           icon: Icon(
//                             Icons.close,
//                             color: Colors.white,
//                           )),
//                       Text(
//                         'Tạo bài viết',
//                         style: TextStyle(
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Container(
//                           width: 30.0,
//                           height: 30.0,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       "https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg"),
//                                   fit: BoxFit.cover)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Card(
//                             child: Container(
//                               height: MediaQuery.of(context).size.height * 0.6,
//                               color: Colors.white,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: EdgeInsets.all(16.0),
//                                     child: TextField(
//                                       maxLines: 3,
//                                       decoration: InputDecoration(
//                                           hintText: 'Bạn đang nghĩ gì...',
//                                           border: InputBorder.none),
//                                       style: TextStyle(color: Colors.grey),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(16.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Text(
//                                           'Tạo mới',
//                                           style: TextStyle(color: Colors.grey),
//                                         ),
//                                         Icon(
//                                           Icons.note_add,
//                                           color: Colors.grey,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         // image != null
//                         //     // ? Card(
//                         //     //     margin: EdgeInsets.symmetric(horizontal: 8.0),
//                         //     //     child: Container(
//                         //     //       height: 300.0,
//                         //     //       child: Image.file(
//                         //     //         imageselect!,
//                         //     //         width: double.infinity,
//                         //     //         fit: BoxFit.cover,
//                         //     //       ),
//                         //     //     ),
//                         //     //   )
//                         //     ? Image.file(image!, 
//                         //     width: double.infinity,
//                         //             fit: BoxFit.cover,)
//                         //     : Container(
//                         //         decoration: BoxDecoration(
//                         //           image: DecorationImage(
//                         //             image: NetworkImage(
//                         //                 "https://www.als.org/sites/default/files/styles/hero_image/public/2020-06/Hero-New-Site_08.jpg?h=be2185f4&itok=qkJVB6S9"),
//                         //             fit: BoxFit.cover,
//                         //           ),
//                         //         ),
//                         //       )
//                         (imagePath != null)
//                     ? Image.file(File(imagePath!))
//                     : Container(
//                         width: 300,
//                         height: 300,
//                         color: Colors.grey[300]!,
//                       ),
//                       ],
//                     ),
//                   ),
//                   Container(
//                     // margin: EdgeInsets.only(bottom: 15.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         pickMedia(ImageSource.gallery);
//                       },
//                       child: Text(
//                         'Tải ảnh',
//                         style: TextStyle(fontSize: 24.0),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(bottom: 10.0),
//                     margin: EdgeInsets.only(top: 20.0),
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         primary: greenALS,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         elevation: 15.0,
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: Text(
//                           'ĐĂNG BÀI',
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//   );
//    void pickMedia(ImageSource source) async {
//     XFile? file;
//     if (_mediaType == MediaType.image) {
//       file = await ImagePicker().pickImage(source: source);
//     } else {
//       file = await ImagePicker().pickVideo(source: source);
//     }
//     if (file != null) {
//       imagePath = "https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg";

//       setState(() {});
//     }
//   }
     
//   }

  

