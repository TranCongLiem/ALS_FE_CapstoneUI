import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/CustomExerciseList.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/exercise/exercise_bloc_bloc.dart';
import '../../services/api_Exercise.dart';

class ListExerciseByCategory extends StatelessWidget {
  const ListExerciseByCategory({super.key, required this.categoryExericse});

  final CategoryExercise categoryExericse;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => ExerciseBlocBloc(
                  RepositoryProvider.of<ExerciseService>(context))
                ..add(LoadExerciseByCateEvent(
                    categoryId: categoryExericse.categoryId ?? ''))),
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
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Danh sách bài tập về ${categoryExericse.categoryName}',
                    style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.grey),
                  ),
                ),
                Expanded(child:
                        BlocBuilder<ExerciseBlocBloc, ExerciseBlocState>(
                            builder: (context, state) {
                  print('abc' + state.toString());
                  if (state is ExerciseLoadedState) {
                    print('Print ExState');

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
                })

                    //  ListView.builder(
                    //   itemCount: 10,
                    //   shrinkWrap: true,
                    //   itemBuilder: (context, index) => Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    //     child: Card(
                    //       elevation: 3.0,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(0.0),
                    //       ),
                    //       child: Column(
                    //         children: [
                    //           Container(
                    //             width: MediaQuery.of(context).size.width,
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 10.0, vertical: 10.0),
                    //             child: Row(
                    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: <Widget>[
                    //                 Row(
                    //                   crossAxisAlignment: CrossAxisAlignment.start,
                    //                   mainAxisAlignment: MainAxisAlignment.start,
                    //                   children: <Widget>[
                    //                     Container(
                    //                       width: 110.0,
                    //                       height: 110.0,
                    //                       child: CircleAvatar(
                    //                         backgroundColor: Colors.green,
                    //                         foregroundColor: Colors.green,
                    //                         backgroundImage: NetworkImage(
                    //                             "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       width: 10.0,
                    //                     ),
                    //                     Column(
                    //                       crossAxisAlignment:
                    //                           CrossAxisAlignment.start,
                    //                       children: <Widget>[
                    //                         Text(
                    //                           'Bài tập 1',
                    //                           style: TextStyle(
                    //                               color: Colors.black,
                    //                               fontSize: 24.0,
                    //                               fontWeight: FontWeight.bold),
                    //                         ),
                    //                         SizedBox(
                    //                           height: 5.0,
                    //                         ),
                    //                         // Text(
                    //                         //   'Mức độ dễ',
                    //                         //   style: TextStyle(color: Colors.grey),
                    //                         // ),
                    //                         TextButton(
                    //                             style: TextButton.styleFrom(
                    //                                // foregroundColor: Colors.white,
                    //                                 backgroundColor: Colors.red[400]),
                    //                             onPressed: () {},
                    //                             child: Text(
                    //                               'Khó',
                    //                               style: TextStyle(fontSize: 20.0),
                    //                             ))
                    //                       ],
                    //                     )
                    //                   ],
                    //                 ),
                    //                 Container(
                    //                   alignment: Alignment.center,
                    //                   padding: EdgeInsets.symmetric(
                    //                       horizontal: 10.0, vertical: 10.0),
                    //                   child: ElevatedButton(
                    //                       onPressed: () {},
                    //                       child: Text(
                    //                         "Thêm",
                    //                         style: TextStyle(
                    //                             color: Colors.white, fontSize: 20.0),
                    //                       ),
                    //                       style: ElevatedButton.styleFrom(
                    //                           //backgroundColor: greenALS,
                    //                           padding: EdgeInsets.all(15.0),
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(15.0)))),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //           Container(
                    //             alignment: Alignment.topLeft,
                    //             padding: EdgeInsets.all(10.0),
                    //             child: Text(
                    //               'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
                    //               maxLines: 5,
                    //               style: TextStyle(
                    //                 fontSize: 24.0,
                    //                 fontWeight: FontWeight.w300,
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    ),
              ],
            ),
          ),
        ));
  }
  // @override
  // State<ListExerciseByCategory> createState() => _ListExerciseByCategoryState(categoryExericse);
}

// class _ListExerciseByCategoryState extends State<ListExerciseByCategory>{
  // @override
  // Widget build(BuildContext context) {
  //   // return MultiBlocProvider(
  //   //   providers: [
  //   //     BlocProvider(
  //   //           create: (context) => ExerciseBlocBloc(
  //   //               RepositoryProvider.of<ExerciseService>(context))
  //   //             ..add(LoadExerciseByCateEvent(categoryId: categoryExerics ))),
        
  //   //   ],
  //   //   child: Container(),
  //   // )
  //   // Scaffold(
  //   //   appBar: AppBar(
  //   //     title: Text('Danh sách bài tập'),
  //   //     elevation: 0.0,
  //   //     backgroundColor: greenALS,
  //   //   ),
  //   //   body: Container(
  //   //     child: Column(
  //   //       children: [
  //   //         Container(
  //   //           alignment: Alignment.center,
  //   //           padding: EdgeInsets.all(30.0),
  //   //           child: Text(
  //   //             'Danh sách bài tập tay',
  //   //             style: TextStyle(
  //   //                 fontSize: 32.0,
  //   //                 fontWeight: FontWeight.w800,
  //   //                 color: Colors.grey),
  //   //           ),
  //   //         ),
  //   //         Expanded(
  //   //           child: ListView.builder(
  //   //             itemCount: 10,
  //   //             shrinkWrap: true,
  //   //             itemBuilder: (context, index) => Container(
  //   //               width: MediaQuery.of(context).size.width,
  //   //               padding:
  //   //                   EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //   //               child: Card(
  //   //                 elevation: 3.0,
  //   //                 shape: RoundedRectangleBorder(
  //   //                   borderRadius: BorderRadius.circular(0.0),
  //   //                 ),
  //   //                 child: Column(
  //   //                   children: [
  //   //                     Container(
  //   //                       width: MediaQuery.of(context).size.width,
  //   //                       padding: EdgeInsets.symmetric(
  //   //                           horizontal: 10.0, vertical: 10.0),
  //   //                       child: Row(
  //   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   //                         crossAxisAlignment: CrossAxisAlignment.start,
  //   //                         children: <Widget>[
  //   //                           Row(
  //   //                             crossAxisAlignment: CrossAxisAlignment.start,
  //   //                             mainAxisAlignment: MainAxisAlignment.start,
  //   //                             children: <Widget>[
  //   //                               Container(
  //   //                                 width: 110.0,
  //   //                                 height: 110.0,
  //   //                                 child: CircleAvatar(
  //   //                                   backgroundColor: Colors.green,
  //   //                                   foregroundColor: Colors.green,
  //   //                                   backgroundImage: NetworkImage(
  //   //                                       "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
  //   //                                 ),
  //   //                               ),
  //   //                               SizedBox(
  //   //                                 width: 10.0,
  //   //                               ),
  //   //                               Column(
  //   //                                 crossAxisAlignment:
  //   //                                     CrossAxisAlignment.start,
  //   //                                 children: <Widget>[
  //   //                                   Text(
  //   //                                     'Bài tập 1',
  //   //                                     style: TextStyle(
  //   //                                         color: Colors.black,
  //   //                                         fontSize: 24.0,
  //   //                                         fontWeight: FontWeight.bold),
  //   //                                   ),
  //   //                                   SizedBox(
  //   //                                     height: 5.0,
  //   //                                   ),
  //   //                                   // Text(
  //   //                                   //   'Mức độ dễ',
  //   //                                   //   style: TextStyle(color: Colors.grey),
  //   //                                   // ),
  //   //                                   TextButton(
  //   //                                       style: TextButton.styleFrom(
  //   //                                          // foregroundColor: Colors.white,
  //   //                                           backgroundColor: Colors.red[400]),
  //   //                                       onPressed: () {},
  //   //                                       child: Text(
  //   //                                         'Khó',
  //   //                                         style: TextStyle(fontSize: 20.0),
  //   //                                       ))
  //   //                                 ],
  //   //                               )
  //   //                             ],
  //   //                           ),
  //   //                           Container(
  //   //                             alignment: Alignment.center,
  //   //                             padding: EdgeInsets.symmetric(
  //   //                                 horizontal: 10.0, vertical: 10.0),
  //   //                             child: ElevatedButton(
  //   //                                 onPressed: () {},
  //   //                                 child: Text(
  //   //                                   "Thêm",
  //   //                                   style: TextStyle(
  //   //                                       color: Colors.white, fontSize: 20.0),
  //   //                                 ),
  //   //                                 style: ElevatedButton.styleFrom(
  //   //                                     //backgroundColor: greenALS,
  //   //                                     padding: EdgeInsets.all(15.0),
  //   //                                     shape: RoundedRectangleBorder(
  //   //                                         borderRadius:
  //   //                                             BorderRadius.circular(15.0)))),
  //   //                           )
  //   //                         ],
  //   //                       ),
  //   //                     ),
  //   //                     Container(
  //   //                       alignment: Alignment.topLeft,
  //   //                       padding: EdgeInsets.all(10.0),
  //   //                       child: Text(
  //   //                         'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
  //   //                         maxLines: 5,
  //   //                         style: TextStyle(
  //   //                           fontSize: 24.0,
  //   //                           fontWeight: FontWeight.w300,
  //   //                         ),
  //   //                       ),
  //   //                     ),
  //   //                   ],
  //   //                 ),
  //   //               ),
  //   //             ),
  //   //           ),
  //   //         ),
  //   //       ],
  //   //     ),
  //   //   ),
  //   // );
  // }
//}
