
import 'package:capstone_ui/Feature/Profile/profileInfo.dart';
import 'package:capstone_ui/Feature/Profile/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/user_detail/user_detail_bloc.dart';
import '../../Constant/constant.dart';
import '../../Model/getProfileUser_model.dart';
import '../../services/api_User.dart';

// class ProfileBody extends StatelessWidget {
//   const ProfileBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     //double defaultSize = SizeConfig.defaultSize;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
//               builder: (context, state) {
//             if (state is GetDetailLoadedState) {
//               return SizedBox(
//                 height: 240,
//                 child: Stack(
//                   children: [
//                     ClipPath(
//                       clipper: CustomeShape(),
//                       child: Container(
//                         height: 150,
//                         color: greenALS,
//                       ),
//                     ),
//                     Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(bottom: 10),
//                             height: 140,
//                             width: 140,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.white,
//                                 width: 8,
//                               ),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: AssetImage(
//                                     "assets/images/logo_Avatar.jpg"),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             state.getProfileUserByIdResponeModel.fullName.toString(),
//                             style: TextStyle(
//                               fontSize: 22,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//           SizedBox(
//             height: 20,
//           ),
//           ProfileMenuItem(
//             iconSrc: "assets/images/logout-svgrepo-com.svg",
//             title: "Đăng xuất",
//             press: () {},
//           ),
//         ],
//       ),
//     );
//   }
// }
Widget ProfileBody(GetProfileUserByIdResponeModel getProfileUserByIdResponeModel, BuildContext context){
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
                                image:  NetworkImage(getProfileUserByIdResponeModel.imageUser.toString()),
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
