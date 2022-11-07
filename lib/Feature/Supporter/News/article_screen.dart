// import 'package:capstone_ui/Feature/News/model/article_model.dart';
// import 'package:capstone_ui/Model/getListKnowledge_model.dart';
// import 'package:flutter/material.dart';

// import '../../Constant/constant.dart';

// // class ArticleScreen extends StatelessWidget {
// //   const ArticleScreen({Key? key, required this.article}) : super(key: key);

// //   final Article article;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           article.title ?? "",

// //         ),
// //         backgroundColor: greenALS,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.start,
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Container(
// //               height: 250.0,
// //               width: double.infinity,
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: NetworkImage(article.urlToImage ?? ""),
// //                   fit: BoxFit.cover,
// //                 ),
// //                 //borderRadius: BorderRadius.circular(12.0),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 8.0,
// //             ),
// //             Container(
// //               padding: EdgeInsets.all(6.0),
// //               decoration: BoxDecoration(
// //                 color: Colors.lightGreen,
// //                 borderRadius: BorderRadius.circular(10.0),
// //               ),
// //               child: Text(
// //                 article.source?.name ?? "",
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 8.0,
// //             ),
// //             Text(
// //               article.description ?? "",
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// Widget ArticleScreen(ListKnowledge listKnowledge, BuildContext context){
//   return Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 250.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(listKnowledge.image ?? ''),
//                   fit: BoxFit.cover,
//                 ),
//                 //borderRadius: BorderRadius.circular(12.0),
//               ),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             Container(
//               padding: EdgeInsets.all(6.0),
//               decoration: BoxDecoration(
//                 color: Colors.lightGreen,
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Text(
//                 listKnowledge.title ?? '',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             Text(
//               listKnowledge.description ?? '',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//             ),
//           ],
//         ),
//       );
    
// }