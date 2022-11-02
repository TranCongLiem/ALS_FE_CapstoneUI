import 'package:capstone_ui/Feature/Excerise/ListExerciseByCategory.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Components/Feature/Excerise/Excerise/category_ex.dart';
import '../../Feature/News/detail_news.dart';

Widget CustomCategoryList(
    CategoryExercise categoryExericse, BuildContext context) {
  return Container(
    height: 100,
    width: 200,
    child: Column(
      children: [
        Card(
          child: Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                    height: 180,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListExerciseByCategory(
                                    categoryExericse: categoryExericse)));
                      },
                    ),
                    image: NetworkImage(categoryExericse.categoryImage ?? '')),
                Text(
                  categoryExericse.categoryName ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontSize: 26.0),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 12,
        )
      ],
    ),
  );
}
