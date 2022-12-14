import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/session/session_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Feature/Session/creating_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/categoryExercise/category_exercise_bloc.dart';
import '../../Bloc/exercise/exercise_bloc_bloc.dart';
import '../../services/api_CategoryExercise.dart';
import '../../services/api_Exercise.dart';

class SessionExercise extends StatefulWidget {
  const SessionExercise({super.key});

  @override
  State<SessionExercise> createState() => _SessionExerciseState();
}

class _SessionExerciseState extends State<SessionExercise> {
  bool isChecked = false;
  String category_in_Session = '';
  // late CategoryExercise categoryExercise;
  int? tappedIndex;

  Color backgroundColor = Colors.white;

  Future LoadExBycate(String cate) async {
    category_in_Session = cate;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // LoadExBycate(widget.listCategorysOfExercise.elementAt(1).categoryId.toString());
    //LoadExBycate('3FA85F64-5717-4562-B3FC-2C963F66AFA5');
    //  categoryExercise= CategoryExercise(
    //       categoryId: '', categoryImage: '', categoryName: 'Tất cả');
    tappedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => CategoryExerciseBlocBloc(
                RepositoryProvider.of<CategoryExerciseService>(context))
              ..add(LoadCategoryExerciseEvent())),
        BlocProvider(
            create: (context) => ExerciseBlocBloc(
                RepositoryProvider.of<ExerciseService>(context))
              ..add(LoadAllExerciseEvent())),
      ],
      child: BlocBuilder<SessionBloc, SessionState>(
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
                    fontWeight: FontWeight.w500),
              ),
            ),
            body: BlocBuilder<AuthenticateBloc, AuthenticateState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Expanded(
                        child: BlocBuilder<CategoryExerciseBlocBloc,
                                CategoryExerciseBlocState>(
                            builder: (context, state) {
                          if (state is CategoryExerciseLoadedState) {
                            return ListView(
                              physics: ClampingScrollPhysics(),
                              children: [
                                Container(
                                  height: 40,
                                  child: ListView.builder(
                                      itemCount: state.list.length,
                                      padding: EdgeInsets.only(left: 16),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        // return CustomCategoryListInSession(state.list[index], context);
                                        bool select = true;
                                        return Container(
                                          margin: EdgeInsets.only(right: 16),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  tappedIndex = index;
                                                  print(
                                                      'cateID:  $state.list[index].categoryId');
                                                  category_in_Session = state
                                                          .list[index]
                                                          .categoryId ??
                                                      '';

                                                  BlocProvider.of<
                                                              ExerciseBlocBloc>(
                                                          context)
                                                      .add(LoadExerciseByCateEvent(
                                                          categoryId:
                                                              category_in_Session));
                                                });
                                              },
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty.all(
                                                      EdgeInsets.symmetric(
                                                          vertical: 5.0,
                                                          horizontal: 10.0)),
                                                  backgroundColor: tappedIndex == index
                                                      ? MaterialStateProperty.all<Color>(
                                                          greenALS)
                                                      : MaterialStateProperty.all<Color>(
                                                          Colors.white),
                                                  shape: MaterialStateProperty.all<
                                                          RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(18.0),
                                                          side: BorderSide(color: greenALS)))),
                                              child: Text(
                                                state.list[index]
                                                        .categoryName ??
                                                    '',
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                //category_in_Session = state.list[index].categoryName,
                                                style: TextStyle(
                                                    fontSize: 26,
                                                    fontWeight: FontWeight.w400,
                                                    color: tappedIndex == index
                                                        ? Colors.white
                                                        : Colors.black),
                                              )),
                                        );
                                      }),
                                ),
                              ],
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }),
                        //--//oke
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(child: ListExceriseByCateInSession(context)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CurrentSession()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Buổi tập hiện tại',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

Widget ListExceriseByCateInSession(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Expanded(child: BlocBuilder<ExerciseBlocBloc, ExerciseBlocState>(
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
  );
}
