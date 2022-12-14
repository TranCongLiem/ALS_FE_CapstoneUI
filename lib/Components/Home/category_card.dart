import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../Constant/constant.dart';

class CategoryCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final press;
  const CategoryCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SizerUtil.deviceType == DeviceType.mobile
          ? Container(
              width: 100.w,
              height: 20.5.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  width: 20.w, //It will take a 20% of screen width
                  height: 30.h,
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
                            SvgPicture.asset(
                              svgSrc,
                              width: 60.h,
                              height: 45.h,
                            ),
                            Spacer(),
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 38.0.sp, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
          : Container(
              width: 100.w,
              height: 12.5.h,
              child: ClipRRect(
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
                            Text(
                              title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.0.sp, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ));
    });
  }
}
