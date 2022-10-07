import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../Constant/constant.dart';

class CategoryEx extends StatelessWidget {
  final String svgSrc;
  final String name;
  final press;
  const CategoryEx({
    Key? key,
    required this.svgSrc,
    required this.name,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Ink.image(
                    height: 200,
                    width: 180,
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                    image: NetworkImage(svgSrc)),
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 251, 252, 251),
                      fontSize: 35.0),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
