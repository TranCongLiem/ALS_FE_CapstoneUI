import 'package:capstone_ui/Feature/Excerise/ListExerciseByCategory.dart';
import 'package:capstone_ui/Model/getListCategory_model.dart';
import 'package:flutter/material.dart';

Widget CustomCategoryList(
    CategoryExercise categoryExericse, BuildContext context) {
  return SizedBox(
    height: 100,
    width: 200,
    child: Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Ink.image(
                    height: 160,
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
              ),
              Text(
                categoryExericse.categoryName ?? '',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 251, 252, 251),
                    fontSize: 28.0),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
