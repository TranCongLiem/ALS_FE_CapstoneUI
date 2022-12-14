import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:capstone_ui/services/api_Session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/exercise/exercise_bloc_bloc.dart';
import '../../Bloc/search_ex_byname/search_exercise_bloc_bloc.dart';
import '../../services/api_Exercise.dart';

class ListExerciseByName extends StatelessWidget {
  const ListExerciseByName({super.key, required this.searchKeyword});

  //final CategoryExercise categoryExericse;
  final String searchKeyword;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => SearchExerciseBlocBloc(
                  RepositoryProvider.of<ExerciseService>(context))
                ..add(LoadExerciseByNameEvent(
                    name: searchKeyword))),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('Danh sách bài tập'),
            elevation: 0.0,
            backgroundColor: greenALS,
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Danh sách bài tập liên quan đến  ${searchKeyword}',
                    style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
                Expanded(child:
                    BlocBuilder<ExerciseBlocBloc, ExerciseBlocState>(
                        builder: (context, state) {
                  if (state is ExerciseLoadedState) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.list.length,
                      itemBuilder: (context, index) {
                        return CustomExerciseList(state.list[index], context);
                      },
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                    // child: Text('a'),
                  );
                })),
              ],
            ),
          ),
        ));
  }
}
