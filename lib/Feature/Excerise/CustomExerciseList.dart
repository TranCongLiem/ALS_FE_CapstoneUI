import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';

Widget CustomExerciseList(Exericse exericse, BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Video(exericse: exericse)));
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
                          backgroundImage:
                              NetworkImage("https://d2f8l4t0zpiyim.cloudfront.net/000_clients/61768/page/617689vc83rMf.gif"),
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
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
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
          ],
        ),
      ),
    ),
  );
}
