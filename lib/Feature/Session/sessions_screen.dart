import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/Session/session_detail_screen.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/services/api_Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/exercise/exercise_bloc_bloc.dart';
import '../../services/api_Exercise.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<SessionBloc, SessionState>(
      // listener: (context, state) {
      //   if (state.sessions != null || state.sessions != []) {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (BuildContext context) => this));
      //   }
      // },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Buổi tập của bạn',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 26.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Các buổi tập',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                        ButtonCreateEx(),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<SessionBloc, SessionState>(
                  builder: (context, state) {
                    if (state.sessions != null || state.sessions != []) {
                      return Expanded(
                          child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.sessions.length,
                        itemBuilder: (context, index) {
                          return _buildSessions(context, index);
                        },
                      ));
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                // Expanded(
                //     child: ListView.builder(
                //   physics: BouncingScrollPhysics(),
                //   itemCount: state.sessions.length,
                //   itemBuilder: (context, index) {
                //     return _buildSessions(context, index);
                //   },
                // ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSessions(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    //Course course = courses[index];

    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        // if (index < state.sessions.length) {
        //   final session = state.sessions[index];
        //   final sessionId = session.sessionId;
        //   if (sessionId != null && sessionId != "") {
        //     context
        //         .read<SessionBloc>()
        //         .add(SessionEvent.getSessionDetailRequested(sessionId));
        //   }
        // }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20 / 2,
          ),
          child: Container(
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      blurRadius: 30.0,
                      offset: Offset(10, 15))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  // context.read<SessionBloc>().add(
                  //     SessionEvent.getSessionDetailRequested(
                  //         state.sessions[index].sessionId));
                  var details =
                      state.detailsList![state.sessions[index].sessionId];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SessionDetail(details: details!)));
                },
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.25,
                      height: size.height * 0.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: NetworkImage(
                              "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.4,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20 / 2, top: 20 / 1.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tên Buổi Tập",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            // Row(
                            //   children: [
                            //     Icon(
                            //       Icons.folder_open_rounded,
                            //       color: Colors.black45,
                            //     ),
                            //     SizedBox(
                            //       width: size.width * 0.01,
                            //     ),
                            //     Text(
                            //       course.students,
                            //       style: TextStyle(
                            //         color: black.withOpacity(0.3),
                            //       ),
                            //     )
                            //   ],
                            // ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_outlined,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Text(
                                  //state.details!.length.toString() + ' exercises',
                                  state.exercisesCount![
                                              state.sessions[index].sessionId]
                                          .toString() +
                                      " Bài tập",
                                  style: TextStyle(
                                    color: Colors.black45,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
