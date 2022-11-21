import 'dart:math';

import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Model/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsScreen extends StatefulWidget {
  @override
  _SessionsScreenState createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  //ExerciseType selectedType = ExerciseType.low;

  @override
  Widget build(BuildContext context) => SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(height: 8),
              Text(
                'Exercise',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              // SizedBox(height: 8),
              // buildDifficultyLevel(),
              SizedBox(height: 8),
              buildWorkouts(),
            ],
          ),
        ),
      );

  Widget buildWorkouts() => BlocBuilder<SessionBloc, SessionState>(
        builder: (context, state) {
          return GestureDetector(
            //onHorizontalDragEnd: swipeFunction,
            child: Column(
              children: state.sessions
                  .map(
                    (session) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: SessionWidget(session: session)),
                  )
                  .toList(),
            ),
          );
        },
      );

  // Widget buildDifficultyLevel() => Row(
  //       children: ExerciseType.values.map(
  //         (type) {
  //           final name = getExerciseName(type);
  //           final fontWeight =
  //               selectedType == type ? FontWeight.bold : FontWeight.normal;

  //           return Expanded(
  //             child: Center(
  //               child: GestureDetector(
  //                 behavior: HitTestBehavior.opaque,
  //                 onTap: () => setState(() => selectedType = type),
  //                 child: Container(
  //                   padding: EdgeInsets.symmetric(vertical: 8),
  //                   child: Text(
  //                     name,
  //                     style: TextStyle(fontWeight: fontWeight, fontSize: 16),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //       ).toList(),
  //     );

  // void swipeFunction(DragEndDetails dragEndDetails) {
  //   final selectedIndex = ExerciseType.values.indexOf(selectedType);
  //   final hasNext = selectedIndex < ExerciseType.values.length;
  //   final hasPrevious = selectedIndex > 0;

  //   setState(() {
  //     if (dragEndDetails.primaryVelocity < 0 && hasNext) {
  //       final nextType = ExerciseType.values[selectedIndex + 1];
  //       selectedType = nextType;
  //     }
  //     if (dragEndDetails.primaryVelocity > 0 && hasPrevious) {
  //       final previousType = ExerciseType.values[selectedIndex - 1];
  //       selectedType = previousType;
  //     }
  //   });
  // }
}

// class SessionWidget extends StatefulWidget {
//   final Session? session;

//   const SessionWidget({
//     super.key,
//     this.session,
//   });

//   @override
//   State<SessionWidget> createState() => _SessionWidgetState();
// }

// class _SessionWidgetState extends State<SessionWidget> {

//   List colors = [
//     Color.fromRGBO(165,200,228, 1),
//     Color.fromRGBO(192, 236, 204, 1),
//     Color.fromRGBO(249, 240, 193, 1),
//     Color.fromRGBO(244, 205, 166, 1),
//     ];

//   Random random = new Random();

//   @override
//   Widget build(BuildContext context) => GestureDetector(
//         // onTap: () => Navigator.of(context).push(MaterialPageRoute(
//         //   builder: (context) => ExercisePage(exerciseSet: exerciseSet),
//         // )),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           height: 100,
//           decoration: BoxDecoration(
//             color: colors[random.nextInt(4)],
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Expanded(flex: 3, child: buildText(session)),
//               //Expanded(child: Image.asset(exerciseSet.imageUrl))
//             ],
//           ),
//         ),
//       );

//   Widget buildText(Session session) {

//     final exercises = .exercises.length;
//     final minutes = exerciseSet.totalDuration;

//     return BlocBuilder<SessionBloc, SessionState>(
//       builder: (context, state) {
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Session Name",
//               style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
//             ),
//             SizedBox(height: 10),
//             Text(" Exercises  Mins'"),
//           ],
//         );
//       },
//     );
//   }
// }

List colors = [
  Color.fromRGBO(165, 200, 228, 1),
  Color.fromRGBO(192, 236, 204, 1),
  Color.fromRGBO(249, 240, 193, 1),
  Color.fromRGBO(244, 205, 166, 1),
];

Random random = new Random();

class SessionWidget extends StatelessWidget {
  final GetSessionsResponseModel session;

  const SessionWidget({
    required this.session,
  });

  @override
  Widget build(BuildContext context) => BlocConsumer<SessionBloc, SessionState>(
        listener: (context, state) {
          if (session != null) {
            context.read<SessionBloc>().add(
                SessionEvent.getSessionDetailRequested(session.sessionId!));
          }
        },
        builder: (context, state) {
          return GestureDetector(
            // onTap: () => Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => ExercisePage(exerciseSet: exerciseSet),
            // )),
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                color: colors[random.nextInt(4)],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(flex: 3, child: buildText(state.details)),
                  //Expanded(child: Image.asset(exerciseSet.imageUrl))
                ],
              ),
            ),
          );
        },
      );

  Widget buildText(List<GetSessionDetailResponseModel>? details) {
    final exercises = details?.length;
    //final minutes = exerciseSet.totalDuration;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Session Name",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        SizedBox(height: 10),
        Text('$exercises Exercises'),
      ],
    );
  }
}
