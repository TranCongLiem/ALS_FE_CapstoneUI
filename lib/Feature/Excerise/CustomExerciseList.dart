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

  return Container(
    //  appBar: AppBar(
    //     title: Text('demo Get Exercoise'),
    //   ),
    //body: Center(
    // child: Text('abc'),

    // child:  Center(
    //   child: Text(exericse.ExerciseName?? ''),

    // ),
    height: 100,
    width: 200,
    // decoration: BoxDecoration(
    //   color: Colors.green[50],
    //   borderRadius: BorderRadius.circular(10),
    //),
    child: Column(
      children: [
        Card(
          // clipBehavior: Clip.antiAlias,
          // shape:
          //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Expanded(          
            child: Stack(
              alignment: Alignment.center,
              children: [               
                Ink.image(
                    height: 180,
                  //  width: 150,
                    //fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                    image: NetworkImage(
                        "https://cdn-prod.medicalnewstoday.com/content/images/articles/324/324489/wrist-rotations.jpg")),
                Text(
                  exericse.ExerciseName ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 252, 251),
                      fontSize: 20.0),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 12,
        )
      ],
    ),
  );
  //appBar: Title(color: Colors.red, child: Text('demo Get Exercoise')),);
}
