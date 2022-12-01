import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Profile/profile_body.dart';
import 'package:capstone_ui/Feature/Profile/profile_listnewsfeed.dart';
import 'package:capstone_ui/Feature/Profile/profile_menu.dart';
import 'package:capstone_ui/Feature/Profile/profile_update.dart';
import 'package:flutter/material.dart';
import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Bloc/user_detail/user_detail_bloc.dart';
import '../../Login/login_screen.dart';
import '../../Model/UpdateDeviceTokenMobile.dart';
import '../../Splash/SharePreKey.dart';
import '../../services/api_User.dart';
import '../../services/api_login.dart';
import 'profile_listnewsfeed.dart';
// import 'package:capstone_ui/Home/Components/BottomNavigation.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfiletState();
}

class _ProfiletState extends State<Profile> {
  // int index = 4;
  UserService _UserService = UserService();
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
                                  builder: ((context) => ProfileUpdate(
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
                          return ProfileBody(
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
                                  userId: state2.userId));
                          context
                              .read<AuthenticateBloc>()
                              .add(AuthenticateEvent.Logout());
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
                              SvgPicture.asset(
                                'assets/images/logout-svgrepo-com.svg',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'Đăng Xuất',
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
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => ListNewsFeed()));
                      //   },
                      //   child: Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 30),
                      //     child: Row(
                      //       children: [
                      //         Icon(Icons.view_agenda),
                      //         SizedBox(width: 20),
                      //         Text(
                      //           'Lịch sử bài đăng',
                      //           style: TextStyle(
                      //             fontSize: 16,
                      //             color: Colors.black,
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         Icon(
                      //           Icons.arrow_forward_ios,
                      //           size: 16,
                      //         )
                      //       ],
                      //     ),

                          
                      //   ),
                      // )
                    ],
                  ),
                ),
                bottomNavigationBar: MyBottomNavBar(
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

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => LoginScreen()));
  }
}

