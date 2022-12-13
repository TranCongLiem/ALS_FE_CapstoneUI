import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Feature/Excerise/VideoScreen.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../Constant/constant.dart';

Widget CustomExerciseList(Exericse exericse, BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return BlocBuilder<SessionBloc, SessionState>(
    builder: (context, state) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Video(exericse: exericse)));
          },
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
                              backgroundImage: NetworkImage(exericse.exerciseImage??
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
                                      fontSize: 23.0,
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
                                          backgroundColor: Colors.blue[400]),
                                      onPressed: () {},
                                      child: Text(exericse.exerciseLevel??
                                        'Khó',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white),
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
                        fontSize: 22.0,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        context
                            .read<SessionBloc>()
                            .add(SessionEvent.addToSession(exericse));
                        Fluttertoast.showToast(
                            msg: 'Đã thêm vào phiên tập',
                            backgroundColor: greenALS,
                            fontSize: 18.0);
                      },
                      child: Text(
                        "Thêm vào phiên tập",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: greenALS,
                          padding: EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)))),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
  //----------//Test UI mới
}
