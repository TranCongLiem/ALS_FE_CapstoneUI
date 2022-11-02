import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/user/user_bloc.dart';
import '../../Constant/textfield_widget.dart';
import '../../Constant/profile_widget.dart';
import '../../Model/getProfileUser_model.dart';
import 'profile_screen.dart';

class ProfileUpdate extends StatefulWidget {
  ProfileUpdate({Key? key, required this.getProfileUserByIdResponeModel }) : super(key: key);
  final GetProfileUserByIdResponeModel getProfileUserByIdResponeModel;
  @override
  State<ProfileUpdate> createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String? fullName;
  String? address;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController.text= widget.getProfileUserByIdResponeModel.fullName.toString();
    addressController.text= widget.getProfileUserByIdResponeModel.address.toString();
    fullName= widget.getProfileUserByIdResponeModel.address.toString();
    address= widget.getProfileUserByIdResponeModel.address.toString();
  }
  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state.isUpdatedProfilePatient) {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                alignment: Alignment.center,
                scale: Tween<double>(begin: 0.1, end: 1).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.bounceIn,
                  ),
                ),
                child: child,
              );
            },
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              context
                  .read<UserBloc>()
                  .add(UserEvent.setStateFlase());
              return Profile();
            },
          ),
        );
      }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                leading: BackButton(color: Colors.white),
                backgroundColor: greenALS,
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      context
                      .read<UserBloc>()
                      .add(UserEvent.updateProfilePatientRequest());
                    },
                    child: Text(
                      'Lưu',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  )
                ],
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath:
                        "https://sg.cdnki.com/anh-dai-dien-dep-cho-nam-ngau---aHR0cHM6Ly90aGllcG5oYW5haS5jb20vd3AtY29udGVudC91cGxvYWRzLzIwMjEvMDUvaGluaC1hbmgtZGFpLWRpZW4tZGVwLTEuanBn.webp",
                    isEdit: true,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 24),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Họ ten',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                      
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                      style: TextStyle(fontSize: 26),
                        onChanged: (fullName) {
                    context
                        .read<UserBloc>()
                        .add(UserEvent.getFullName(fullName));
                  },
                    ),
                  ],
                ),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dia chi',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      maxLines: 1,
                      style: TextStyle(fontSize: 26),
                        onChanged: (address) {
                    context
                        .read<UserBloc>()
                        .add(UserEvent.getAddress(address));
                  },
                    ),
                  ],
                ),
                  //   context
                  //       .read<UserBloc>()
                  //       .add(UserEvent.getAddress(value));
                  // },
                  // ),
                ],
              ),
            );
          },
        ),
      );
}
