import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Constant/constant.dart';


class CategoryRecommend extends StatelessWidget {
  final String svgSrc;
  // final String title;
  final press;
  const CategoryRecommend({
    Key? key,
    required this.svgSrc,
    // required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: greenALS,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xFFE6E6E6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  SvgPicture.asset(svgSrc),
                  Spacer(),
                  // Text(
                  //   title,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //       fontSize: 18.0,
                  //       color: Colors.black
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}