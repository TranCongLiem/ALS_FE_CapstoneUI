import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/categoryExercise/category_exercise_bloc.dart';
import '../../Components/BottomNavBar/bottom_nav_bar.dart';
import '../../Constant/constant.dart';
import '../../services/api_CategoryExercise.dart';
import '../CategoryExercise/CustomCategoryList.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key});

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => CategoryExerciseBlocBloc(
                  RepositoryProvider.of<CategoryExerciseService>(context))
                ..add(LoadCategoryExerciseEvent())),
        ],
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            automaticallyImplyLeading: true,
            iconTheme: IconThemeData(color: Colors.black87),
            backgroundColor: Colors.transparent,
            title: Text(
              'Tất cả',
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: BlocBuilder<CategoryExerciseBlocBloc,
                      CategoryExerciseBlocState>(builder: (context, state) {
                    if (state is CategoryExerciseLoadedState) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            scrollDirection: Axis.vertical,
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return CustomCategoryList(
                                  state.list[index], context);
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                ),
              ],
            ),
          ),
        ));
  }
}
