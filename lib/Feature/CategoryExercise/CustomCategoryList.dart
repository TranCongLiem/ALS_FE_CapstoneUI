import 'package:capstone_ui/Feature/Excerise/ListExerciseByCategory.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:capstone_ui/Model/getListExerciseByCate_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Components/Feature/Excerise/Excerise/category_ex.dart';
import '../../Constant/color_filter.dart';
import '../../Feature/News/detail_news.dart';
import '../../Feature/News/model/article_model.dart';

Widget CustomCategoryList(
    CategoryExercise categoryExericse, BuildContext context) {
  return Container(
    height: 100,
    width: 200,
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                    height: 150,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListExerciseByCategory(
                                    categoryExericse: categoryExericse)));
                      },
                    ),
                    image: NetworkImage(categoryExericse.categoryImage ?? ''),
                    colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.9),
                      BlendMode.modulate,
                    )),
                Text(
                  categoryExericse.categoryName ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 28.0),
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
