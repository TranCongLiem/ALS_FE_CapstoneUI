import 'package:capstone_ui/Feature/Profile/profileInfo.dart';
import 'package:flutter/material.dart';
import '../../../Constant/constant.dart';
import '../../../Model/getProfileUser_model.dart';

Widget ProfileBodySupporter(
    GetProfileUserByIdResponeModel getProfileUserByIdResponeModel,
    BuildContext context) {
  return SizedBox(
    height: 240,
    child: Stack(
      children: [
        ClipPath(
          clipper: CustomeShape(),
          child: Container(
            height: 150,
            color: greenALS,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 140,
                width: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 8,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        getProfileUserByIdResponeModel.imageUser.toString()),
                  ),
                ),
              ),
              Text(
                getProfileUserByIdResponeModel.fullName.toString(),
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
