import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/user_detail/user_detail_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
// ignore: unused_import
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Excerise/ListExcerise.dart';
import 'package:capstone_ui/Feature/SaveRecord/home_view.dart';
import 'package:capstone_ui/Feature/SpeechToText/voice_to_text.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Bloc/create_sos_noti/create_sos_noti_bloc.dart';
import '../Components/Home/category_card.dart';
import '../Feature/Chat/pages/home_page.dart';
import '../Feature/SpeechToText/SpeechToText.dart';
import '../Feature/TextToSpeech/TextToSpeech.dart';
import '../Model/getProfileUser_model.dart';
import '../Splash/SharePreKey.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final String userId;
  UserPatientService service = UserPatientService();
  late CreateSosNotiBloc SOSBloc;
  // int index = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
    // SOSBloc = CreateSosNotiBloc(service);
  }

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId2 = prefs.getString(SharedPreferencesKey.SHARED_USER) ?? '';
    setState(() {
      userId = userId2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => GetDetailBloc(
                    RepositoryProvider.of<UserPatientService>(context))
                  ..add(LoadDetailUserEvent(userId: state.userId))),
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
              builder: (context2, state2) {
                return SizerUtil.deviceType == DeviceType.mobile
                    // ignore: sized_box_for_whitespace
                    ? Container(
                        width: 100.w,
                        height: 20.5.h,
                        child: Scaffold(
                          bottomNavigationBar: MyBottomNavBar(),
                          floatingActionButton: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.08,
                            child: FloatingActionButton(
                              // ignore: prefer_const_constructors
                              elevation: 5,
                              backgroundColor: Colors.yellow[700],
                              child: Icon(
                                Icons.sos_outlined,
                                size: 50,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                if (state2 is GetDetailLoadedState) {
                                  if (state2.getProfileUserByIdResponeModel
                                          .relationshipWith ==
                                      null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Bạn chưa liên kết với bất kì người hỗ trợ nào",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.SNACKBAR,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: greenALS,
                                        textColor: Colors.white,
                                        fontSize: 18.0);
                                  } else {
                                    var result = await getPhoneNumberById(
                                        GetPhoneByIdRequestModel(
                                            userId: state2
                                                .getProfileUserByIdResponeModel
                                                .relationshipWith
                                                .toString()));
                                    if (result != null) {
                                      //launch("tel:${result.phoneNumber}");
                                      FlutterPhoneDirectCaller.callNumber(result.phoneNumber??'085921191121');
                                    }
                                  }
                                }
                              },
                            ),
                          ),
                          body: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/anh_web.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 40.0),
                                          child: Text(
                                            "Xin chào!\nHôm nay bạn cần gì?",
                                            style: TextStyle(
                                                fontSize: 35,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(
                                          child: GridView.count(
                                            crossAxisCount: 2,
                                            childAspectRatio: .85,
                                            crossAxisSpacing: 20,
                                            mainAxisSpacing: 20,
                                            children: <Widget>[
                                              CategoryCard(
                                                title:
                                                    "Chuyển văn bản thành giọng nói",
                                                svgSrc: 'assets/icons/text.svg',
                                                press: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              TextToSpeech()));
                                                },
                                              ),
                                              CategoryCard(
                                                title:
                                                    "Chuyển giọng nói thành văn bản",
                                                svgSrc:
                                                    'assets/icons/microphone.svg',
                                                press: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SpeechSampleApp()));
                                                },
                                              ),
                                              CategoryCard(
                                                title: "Lưu giọng nói",
                                                svgSrc:
                                                    "assets/icons/saverecord1.svg",
                                                press: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeViewRecord()));
                                                },
                                              ),
                                              CategoryCard(
                                                title: "Trò chuyện",
                                                svgSrc: "assets/icons/ex1.svg",
                                                press: () {
                                                  if (state2
                                                      is GetDetailLoadedState) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    HomePage(
                                                                      userId: state
                                                                          .userId,
                                                                      userName: state2
                                                                          .getProfileUserByIdResponeModel
                                                                          .fullName
                                                                          .toString(),
                                                                    )));
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ))
                    : Container(
                        width: 100.w,
                        height: 12.5.h,
                        child: Scaffold(
                            bottomNavigationBar: MyBottomNavBar(
                                // index: this.index,
                                ),
                            floatingActionButton: FloatingActionButton(
                              child: Icon(Icons.notifications_active),
                              onPressed: () {},
                            ),
                            body: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/anh_web.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: SafeArea(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 52,
                                              width: 52,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                    image: ExactAssetImage(
                                                        'assets/images/logo_Avatar.jpg')),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 30.0),
                                            child: Text(
                                              "Xin chào!\nHôm nay bạn cần gì?",
                                              style: TextStyle(
                                                fontSize: 35,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GridView.count(
                                              crossAxisCount: 2,
                                              childAspectRatio: .85,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20,
                                              children: <Widget>[
                                                CategoryCard(
                                                  title:
                                                      "Chuyển văn bản thành giọng nói",
                                                  svgSrc:
                                                      'assets/icons/text.svg',
                                                  press: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                TextToSpeech()));
                                                  },
                                                ),
                                                CategoryCard(
                                                  title:
                                                      "Chuyển giọng nói thành văn bản",
                                                  svgSrc:
                                                      'assets/icons/microphone.svg',
                                                  press: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SpeechToText()));
                                                  },
                                                ),
                                                CategoryCard(
                                                  title: "Lưu giọng nói",
                                                  svgSrc:
                                                      "assets/icons/saverecord1.svg",
                                                  press: () {
                                                    Navigator.of(context)
                                                        .pushNamed('/login');
                                                  },
                                                ),
                                                CategoryCard(
                                                  title: "Bài tập",
                                                  svgSrc:
                                                      "assets/icons/ex1.svg",
                                                  press: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ListExcerise()));
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )));
              },
            );
          }),
        );
      },
    );
  }

  Future<GetPhoneByIdResponeModel> getPhoneNumberById(
      GetPhoneByIdRequestModel requestModel) {
    var result = service.getPhoneNumberById(requestModel);
    return result;
  }
}
