import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Components/Feature/Excerise/Excerise/category_ex.dart';
import '../../Feature/News/detail_news.dart';
import '../../Feature/News/model/article_model.dart';

Widget CustomExerciseList(Exericse exericse, BuildContext context) {
  //return Container(
  // return InkWell(
  // onTap: () {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           // builder: ((context) => ArticleScreen(article: article))));
  //           builder: ((context) => DetailNewsScreen(article: exericse)))
  //           );
  // },
  // child: Container(
  //   margin: EdgeInsets.all(15.0),
  //   padding: EdgeInsets.all(10.0),
  //   decoration: BoxDecoration(
  //     color: Colors.white,
  //     borderRadius: BorderRadius.circular(12.0),
  //     boxShadow: [
  //       BoxShadow(
  //         color: Colors.black12,
  //         blurRadius: 3.0,
  //       ),
  //     ],
  //   ),
  //   child: Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         height: 200.0,
  //         width: double.infinity,
  //         decoration: BoxDecoration(
  //           // image: DecorationImage(
  //           //   image: NetworkImage(article.urlToImage ?? ""),
  //           //   fit: BoxFit.cover,
  //           // ),
  //           borderRadius: BorderRadius.circular(12.0),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 8.0,
  //       ),
  //       Container(
  //         padding: EdgeInsets.all(6.0),
  //         decoration: BoxDecoration(
  //           color: Colors.lightGreen,
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //         child: Text(
  //           exericse.ExerciseName?? "",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //       ),
  //       SizedBox(
  //         height: 8.0,
  //       ),
  //       Text(
  //         exericse.Description ?? "",
  //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
  //       ),
  //     ],
  //   ),
  // ),

  // child: Text(exericse.ExerciseName?? ''),
  // );
  //);

//--------------//
  // return Container(
  //   height: 100,
  //   width: 200,
  //   child: Column(
  //     children: [
  //       Card(
  //         child: Expanded(
  //           child: Stack(
  //             alignment: Alignment.center,
  //             children: [
  //               Ink.image(
  //                   height: 180,
  //                   //  width: 150,
  //                   //fit: BoxFit.cover,
  //                   child: InkWell(
  //                     onTap: () {},
  //                   ),
  //                   image: NetworkImage(
  //                       "https://cdn-prod.medicalnewstoday.com/content/images/articles/324/324489/wrist-rotations.jpg")),
  //               Text(
  //                 exericse.ExerciseName ?? '',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Color.fromARGB(255, 251, 252, 251),
  //                     fontSize: 20.0),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         width: 12,
  //       )
  //     ],
  //   ),
  // );
//-------------//
//----------//bi flex over flow
  // final Size size = MediaQuery.of(context).size;
  // return Container(
  //   width: MediaQuery.of(context).size.width,
  //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //   child: Card(
  //     elevation: 3.0,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(0.0),
  //     ),
  //     child: Column(
  //       children: [
  //         Container(
  //           width: MediaQuery.of(context).size.width,
  //           padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Row(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   Container(
  //                     width: 110.0,
  //                     height: 110.0,
  //                     child: CircleAvatar(
  //                       backgroundColor: Colors.green,
  //                       foregroundColor: Colors.green,
  //                       backgroundImage: NetworkImage(
  //                           "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: 10.0,
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       SizedBox(
  //                         width: size.width / 1.75,
  //                         child: Text(
  //                           exericse.ExerciseName ?? '',
  //                           maxLines: 3,
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               fontSize: 24.0,
  //                               fontWeight: FontWeight.bold),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 5.0,
  //                       ),
  //                       // Text(
  //                       //   'Mức độ dễ',
  //                       //   style: TextStyle(color: Colors.grey),
  //                       // ),
  //                       TextButton(
  //                           style: TextButton.styleFrom(
  //                               // foregroundColor: Colors.white,
  //                               backgroundColor: Colors.red[400]),
  //                           onPressed: () {},
  //                           child: Text(
  //                             'Khó',
  //                             style: TextStyle(fontSize: 20.0),
  //                           ))
  //                     ],
  //                   )
  //                 ],
  //               ),

  //             ],
  //           ),
  //         ),
  //         Container(
  //           alignment: Alignment.topLeft,
  //           padding: EdgeInsets.all(10.0),
  //           child: Text(
  //             exericse.Description ??
  //                 'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
  //             maxLines: 5,
  //             style: TextStyle(
  //               fontSize: 24.0,
  //               fontWeight: FontWeight.w300,
  //             ),
  //           ),
  //         ),
  //          Container(
  //                 alignment: Alignment.center,
  //                 padding:
  //                     EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  //                 child: ElevatedButton(
  //                     onPressed: () {},
  //                     child: Text(
  //                       "Thêm",
  //                       style: TextStyle(color: Colors.black, fontSize: 20.0),
  //                     ),
  //                     style: ElevatedButton.styleFrom(
  //                         //backgroundColor: greenALS,
  //                         padding: EdgeInsets.all(15.0),
  //                         shape: RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(15.0)))),
  //               )
  //       ],
  //     ),
  //   ),
  // );

  //----------------//bi flex over flow

  //----------//Test UI mới
  final Size size = MediaQuery.of(context).size;

  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder:(context) => Video(exericse:exericse )));
      },
      child: Card(
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 110.0,
                        height: 110.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.green,
                          backgroundImage: NetworkImage(
                              "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: size.width / 2,
                            child: Text(
                              exericse.ExerciseName ?? '',
                              maxLines: 5,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  style: TextButton.styleFrom(
                                      // foregroundColor:
                                      //Colors.white,
                                      backgroundColor: Colors.red[400]),
                                  onPressed: () {},
                                  child: Text(
                                    'Khó',
                                    style: TextStyle(fontSize: 20.0),
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width / 1,
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  exericse.Description ?? '',
                  maxLines: 5,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Thêm vào phiên tập của bạn",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  style: ElevatedButton.styleFrom(
                      //backgroundColor: greenALS,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)))),
            )
          ],
        ),
      ),
    ),
  );
  //----------//Test UI mới
}
