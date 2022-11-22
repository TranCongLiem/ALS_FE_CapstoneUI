import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Session/CustomExerciseInSessionList.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/services/api_Session.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';

import '../../Bloc/categoryExercise/category_exercise_bloc.dart';
import '../../Bloc/exercise/exercise_bloc_bloc.dart';
import '../../Model/getListCategory_model.dart';
import '../../services/api_CategoryExercise.dart';
import '../../services/api_Exercise.dart';

class CurrentSession extends StatefulWidget {
  const CurrentSession({super.key});

  @override
  State<CurrentSession> createState() => _CurrentSessionState();
}

class _CurrentSessionState extends State<CurrentSession> {
  bool isChecked = false;
  String category_in_Session = '';
  // late CategoryExercise categoryExercise;
  Future LoadExBycate(String cate) async {
    category_in_Session = cate;
  }

  List<Exericse>? exercises;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LoadExBycate(widget.listCategorysOfExercise.elementAt(1).categoryId.toString());
    //LoadExBycate('3FA85F64-5717-4562-B3FC-2C963F66AFA5');
    //  categoryExercise= CategoryExercise(
    //       categoryId: '', categoryImage: '', categoryName: 'Tất cả');
    exercises = context.read<SessionBloc>().state.exercises;
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Tạo buổi tập',
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: BlocBuilder<AuthenticateBloc, AuthenticateState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 50,
                  //   child: Expanded(
                  //     //oke
                  //     child: BlocBuilder<CategoryExerciseBlocBloc,
                  //         CategoryExerciseBlocState>(builder: (context, state) {
                  //       if (state is CategoryExerciseLoadedState) {
                  //         return ListView(
                  //           physics: ClampingScrollPhysics(),
                  //           children: [
                  //             Container(
                  //               height: 50,
                  //               child: ListView.builder(
                  //                   itemCount: state.list.length,
                  //                   padding: EdgeInsets.only(left: 16),
                  //                   scrollDirection: Axis.horizontal,
                  //                   itemBuilder: (context, index) {
                  //                     // return CustomCategoryListInSession(state.list[index], context);
                  //                     bool select = true;
                  //                     return Container(
                  //                       margin: EdgeInsets.only(right: 16),
                  //                       width: 100,
                  //                       child: TextButton(
                  //                           onPressed: () {
                  //                             setState(() {
                  //                               print(
                  //                                   'cateID:  $state.list[index].categoryId');
                  //                               category_in_Session = state
                  //                                       .list[index]
                  //                                       .categoryId ??
                  //                                   '';

                  //                               BlocProvider.of<
                  //                                           ExerciseBlocBloc>(
                  //                                       context)
                  //                                   .add(LoadExerciseByCateEvent(
                  //                                       categoryId:
                  //                                           category_in_Session));
                  //                             });
                  //                           },
                  //                           style: TextButton.styleFrom(
                  //                               backgroundColor:
                  //                                   (select == false)
                  //                                       ? greenALS
                  //                                       : Color.fromARGB(
                  //                                           137, 83, 180, 87)),
                  //                           child: Text(
                  //                             state.list[index].categoryName ??
                  //                                 '',
                  //                             textAlign: TextAlign.center,
                  //                             //category_in_Session = state.list[index].categoryName,
                  //                             style: TextStyle(
                  //                                 fontSize: 26,
                  //                                 fontWeight: FontWeight.w500,
                  //                                 color: (select == false)
                  //                                     ? Colors.white
                  //                                     : Colors.black),
                  //                           )),
                  //                     );
                  //                   }),
                  //             ),
                  //           ],
                  //         );
                  //       }
                  //       return Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                  //     }),
                  //     //--//oke
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: height * 0.05,
                  // ),
                  Expanded(child: ListExceriseInSession(context, refresh)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (exercises != null && exercises!.isNotEmpty) {
                            context.read<SessionBloc>().add(
                                SessionEvent.createSessionRequested(
                                    state.userId));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text(
                                          "Bạn vẫn chưa có bài tập nào trong buổi tập"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text('OK'),
                                        )
                                      ],
                                    ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: greenALS,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 15.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Tạo buổi tập',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      // SizedBox(width: 10),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     context.read<SessionBloc>().add(
                      //         SessionEvent.createSessionRequested(
                      //             state.userId));
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     primary: Colors.blue[300],
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(25),
                      //     ),
                      //     elevation: 15.0,
                      //   ),
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(20.0),
                      //     child: Text(
                      //       'Buổi tập hiện tại',
                      //       style: TextStyle(fontSize: 20),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              );
            },
          ),
        ));
      },
    );
  }
}

Widget ListExceriseInSession(
  BuildContext context,
  VoidCallback refresh,
) {
  return Container(
    child: Column(
      children: [
        Expanded(
          child:
              BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
            //print('abc' + state.toString());
            // if (state is ExerciseLoadedState) {
            //   print('Print ExState');

            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.exercises?.length ?? 0,
              itemBuilder: (context, index) {
                return CustomExerciseInSessionList(
                  state.exercises?[index],
                  refresh,
                  index,
                  context,
                );
              },
            );
            //}
            // return Center(
            //   child: CircularProgressIndicator(),
            //   // child: Text('a'),
            // );
          }),
        ),
      ],
    ),
  );
}