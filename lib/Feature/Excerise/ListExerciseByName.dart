import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/search_ex_byname/search_exercise_bloc_bloc.dart';
import '../../services/api_Exercise.dart';

class SearchExercise extends SearchDelegate<String> {
  final String? hintText;
  SearchExercise({this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  // Other overrides...
  final ExerciseService _exerciseService = ExerciseService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => SearchExerciseBlocBloc(
                RepositoryProvider.of<ExerciseService>(context))
              ..add(LoadExerciseByNameEvent(name: query))),
      ],
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Danh sách bài tập liên quan đến ${query}',
                style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Expanded(child:
            BlocBuilder<SearchExerciseBlocBloc, SearchExerciseBlocState>(
                builder: (context, state) {
                  if (state is SearchExerciseLoadedState) {
                    if (state.list.length == 0) {
                      return Container(
                        child:
                        Text("Không tìm thấy bài tập nào liên quan đến $query"),
                      );
                    }
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
