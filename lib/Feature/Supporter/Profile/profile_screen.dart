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
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Bloc/user_detail/user_detail_bloc.dart';
import '../../../Login/login_screen.dart';
import '../../../Model/UpdateDeviceTokenMobile.dart';
import '../../../Splash/SharePreKey.dart';
import '../../../services/api_User.dart';
import '../../../services/api_login.dart';

// import 'package:capstone_ui/Home/Components/BottomNavigation.dart';

class ProfileSupporter extends StatefulWidget {
  const ProfileSupporter({Key? key}) : super(key: key);

  @override
  State<ProfileSupporter> createState() => _ProfileSupporterState();
}

class _ProfileSupporterState extends State<ProfileSupporter> {
  UserService _UserService = UserService();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state1) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GetDetailBloc(
                    RepositoryProvider.of<UserPatientService>(context))
                  ..add(LoadDetailUserEvent(userId: state1.userId))),
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
                                  builder: ((context) => ProfileUpdate(
                                        getProfileUserByIdResponeModel: state
                                            .getProfileUserByIdResponeModel,
                                        userId: state1.userId,
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
                     
                      InkWell(
                        onTap: () {
                          
                          MoveToLoginAndUpdateToken(                             
                              UpdateDevicetokenMobileRequest(
                                  userId: state1.userId));
                                  context.read<AuthenticateBloc>().add(
                                    AuthenticateEvent.Logout());
                                    print("logout nha");
                                   // print(state1.isAuthenticated);
                                  //state1.isAuthenticated=false;
                          ;
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Row(
                            children: [
                              Icon(Icons.view_agenda),
                              SizedBox(width: 20),
                              Text(
                                'Logout',
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

  Future<void> MoveToLoginAndUpdateToken(
      UpdateDevicetokenMobileRequest updateDevicetokenMobileRequest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(SharedPreferencesKey.SHARED_LOGGED, false);
    await prefs.remove(SharedPreferencesKey.SHARED_PHONE);
    await prefs.remove(SharedPreferencesKey.SHARED_PASSWORD);
    await prefs.remove(SharedPreferencesKey.SHARED_USER);
    var result =
        _UserService.updateDeviceTokenMobile(updateDevicetokenMobileRequest);

    // Navigator.pushAndRemoveUntil(
    //   context,
    //   RouteGenerator.withName("/SplashScreen"),
    //  ModalRoute.withName("/Home")
    // );
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()),
        (Route<dynamic> route) => false);
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
