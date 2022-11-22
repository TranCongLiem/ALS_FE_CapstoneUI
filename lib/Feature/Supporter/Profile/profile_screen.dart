import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Profile/profile_body.dart';
import 'package:capstone_ui/Feature/Profile/profile_listnewsfeed.dart';
import 'package:capstone_ui/Feature/Profile/profile_menu.dart';
import 'package:capstone_ui/Feature/Profile/profile_update.dart';
import 'package:capstone_ui/Feature/Supporter/Profile/profile_body.dart';
import 'package:capstone_ui/Feature/Supporter/Profile/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/user_detail/user_detail_bloc.dart';
import '../../../services/api_User.dart';

// import 'package:capstone_ui/Home/Components/BottomNavigation.dart';

class ProfileSupporter extends StatefulWidget {
  const ProfileSupporter({Key? key}) : super(key: key);

  @override
  State<ProfileSupporter> createState() => _ProfileSupporterState();
}

class _ProfileSupporterState extends State<ProfileSupporter> {
  // int index = 4;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GetDetailBloc(
                    RepositoryProvider.of<UserPatientService>(context))
                  ..add(LoadDetailUserEvent(userId: state2.userId))),
          ],
          child: BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  centerTitle: true,
                  title: Text(
                    "Hồ sơ",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: greenALS,
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        if (state is GetDetailLoadedState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => ProfileUpdateSupporter(
                                        getProfileUserByIdResponeModel: state
                                            .getProfileUserByIdResponeModel,
                                        userId: state2.userId,
                                      ))));
                        }
                      },
                      child: Text(
                        "Chỉnh sửa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
                          builder: (context, state) {
                        if (state is GetDetailLoadedState) {
                          return ProfileBodySupporter(
                              state.getProfileUserByIdResponeModel, context);
                        }
                        return Center(child: CircularProgressIndicator());
                      }),
                      SizedBox(
                        height: 20,
                      ),
                      ProfileMenuItem(
                        iconSrc: "assets/images/logout-svgrepo-com.svg",
                        title: "Đăng xuất",
                        press: () {},
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListNewsFeed()));
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Row(
                            children: [
                              Icon(Icons.view_agenda),
                              SizedBox(width: 20),
                              Text(
                                'Lịc sử bài đăng',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                bottomNavigationBar: MyBottomNavBarSupporter(
                    // index: this.index,
                    ),
              );
            },
          ),
        );
      },
    );
  }
}

// class MyBottomNavBar extends StatelessWidget {
//   MyBottomNavBar({required this.index, required this.callback});
//   final int index;
//   final Function(int) callback;
//   @override
//   Widget build(BuildContext context) {
//     /// BottomNavigationBar is automatically set to type 'fixed'
//     /// when there are three of less items
//     return BottomNavigationBar(
//       currentIndex: index,
//       onTap: callback,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
//         BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Tin tức'),
//         BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
//       ],
//     );
//   }
// }
