import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/session_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListExerciseByCategory extends StatefulWidget {
  const ListExerciseByCategory({super.key});

  @override
  State<ListExerciseByCategory> createState() => _ListExerciseByCategoryState();
}

class _ListExerciseByCategoryState extends State<ListExerciseByCategory> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                'Danh sách bài tập tay',
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: InkWell(
                    onTap: () {},
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 110.0,
                                      height: 110.0,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        foregroundColor: Colors.green,
                                        backgroundImage: NetworkImage(
                                            "https://bloganchoi.com/wp-content/uploads/2018/09/bai-tap-ta-tay.jpg"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: size.width / 1.75,
                                          child: Text(
                                            'Bài tập này về tay nè các bạn ơi. Vô tập đi nha',
                                            maxLines: 3,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          children: [
                                            TextButton(
                                                style: TextButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.white,
                                                    backgroundColor:
                                                        Colors.red[400]),
                                                onPressed: () {},
                                                child: Text(
                                                  'Khó',
                                                  style:
                                                      TextStyle(fontSize: 20.0),
                                                )),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width / 1,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Đây là bài tập kinh điển và đã được chứng minh là cực kỳ hiệu quả qua hàng thế hệ. Đây là bài tập không thể thiếu khi tập tay trước',
                                maxLines: 5,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Thêm",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: greenALS,
                                    padding: EdgeInsets.all(15.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
