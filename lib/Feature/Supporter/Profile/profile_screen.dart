import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Profile/profile_body.dart';
import 'package:capstone_ui/Feature/Profile/profile_menu.dart';
import 'package:capstone_ui/Feature/Profile/profile_update.dart';
import 'package:capstone_ui/Feature/Supporter/Profile/connect_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/user_detail/user_detail_bloc.dart';
import '../../../services/api_User.dart';

class ProfileSupporter extends StatefulWidget {
  const ProfileSupporter({Key? key}) : super(key: key);

  @override
  State<ProfileSupporter> createState() => _ProfileSupporterState();
}

class _ProfileSupporterState extends State<ProfileSupporter> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetDetailBloc(
                RepositoryProvider.of<UserPatientService>(context))
              ..add(LoadDetailUserEvent())),
      ],
      child: BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Text(
                "Hồ sơ",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
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
                                  getProfileUserByIdResponeModel:
                                      state.getProfileUserByIdResponeModel))));
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
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConnectPatient()));
              },
              elevation: 10.0,
              backgroundColor: greenALS,
              label: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Icon(Icons.connect_without_contact_outlined),
                ),
                Text("Kết nối bệnh nhân")
              ]),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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
                  ProfileMenuItem(
                    iconSrc: "assets/images/logout-svgrepo-com.svg",
                    title: "Đăng xuất",
                    press: () {},
                  ),
                ],
              ),
            ),
            bottomNavigationBar: MyBottomNavBarSupporter(),
          );
        },
      ),
    );
  }
}
