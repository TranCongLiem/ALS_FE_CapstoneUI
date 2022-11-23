import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Session/CustomExerciseInSessionList.dart';
import 'package:capstone_ui/Feature/Session/sessions_screen.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Excerise/ListExcerise.dart';

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
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(color: Colors.white),
            backgroundColor: greenALS,
            elevation: 0,
            title: Text(
              'Tạo buổi tập',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: BlocBuilder<AuthenticateBloc, AuthenticateState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListExcerise()));
                            Fluttertoast.showToast(msg: 'Tạo thành công');
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
                    ],
                  ),
                ],
              );
            },
          ),
        );
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
