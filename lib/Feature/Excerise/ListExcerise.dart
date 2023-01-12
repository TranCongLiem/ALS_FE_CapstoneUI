import 'package:capstone_ui/Bloc/categoryExercise/category_exercise_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/CategoryExercise/CustomCategoryList.dart';
import 'package:capstone_ui/Feature/Excerise/ListExerciseByName.dart';
import 'package:capstone_ui/Feature/Excerise/view_all_exercise.dart';
import 'package:capstone_ui/services/api_CategoryExercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Components/BottomNavBar/bottom_nav_bar.dart';

class ListExcerise extends StatefulWidget {
  const ListExcerise({Key? key}) : super(key: key);

  @override
  State<ListExcerise> createState() => _ListExceriseState();
}

class _ListExceriseState extends State<ListExcerise> {
  String outputText = 'Tìm kiếm';

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
          bottomNavigationBar: MyBottomNavBar(
              // ignore: unnecessary_this
              // index: this.index,
              ),
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: greenALS,
            title: Text(
              'Bài tập',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //search bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          showSearch(
                              context: context,
                              delegate: SearchExercise(hintText: 'Tìm kiếm'));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: size.height / 12,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(22)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    outputText,
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Icon(Icons.search)
                              ],
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),

                WidgetEx2(), //Phan Loai/Xem tat ca

                Expanded(
                  child: BlocBuilder<CategoryExerciseBlocBloc,
                      CategoryExerciseBlocState>(builder: (context, state) {
                    if (state is CategoryExerciseLoadedState) {
                      return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          scrollDirection: Axis.vertical,
                          itemCount: state.list.length,
                          itemBuilder: (context, index) {
                            return CustomCategoryList(
                                state.list[index], context);
                          });
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

    ;
  }
}

class WidgetEx2 extends StatelessWidget {
  const WidgetEx2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Phân loại',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewAll()));
            },
            child: Text(
              'Xem tất cả',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
