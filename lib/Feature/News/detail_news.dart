// import 'package:capstone_ui/Feature/News/CustomDetailKnowledgeList.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../Bloc/detailknowledge/detailknowledge_bloc.dart';
// import '../../Model/getListKnowledge_model.dart';
// import '../../services/api_DetailKnowledge.dart';

// class DetailNewsScreen extends StatefulWidget {
//   const DetailNewsScreen({Key? key, required this.listKnowledge}) : super(key: key);

//   final ListKnowledge listKnowledge;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         // backgroundColor: Colors.green,
//         backgroundColor: Color(0xffffff),
//         elevation: 0,
    
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(0.0),
//         child: Stack(
//           children: <Widget>[
//             Image.network( ?? "",
//               fit: BoxFit.cover,
//               height: MediaQuery.of(context).size.height*0.5,
//               width: MediaQuery.of(context).size.width,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Padding(
//                 padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
//                 child: Container(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(35.0),
//                     child: Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
//                           child: Text(
//                             article.title ?? "",
//                             style: TextStyle(
//                               fontSize: 30.0,
//                               fontFamily: 'GothamB'
//                               //
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(20.0),
//                           child: Text(
//                             article.description ?? "",
//                             style: TextStyle(
//                               fontSize: 20.0,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
      
//     );
//   }
// }
