import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/user/user_bloc.dart';
import '../../Constant/profile_widget.dart';
import '../../Model/getProfileUser_model.dart';
import 'profile_screen.dart';

class ProfileUpdate extends StatefulWidget {
  final String userId;
  ProfileUpdate(
      {Key? key,
      required this.getProfileUserByIdResponeModel,
      required this.userId})
      : super(key: key);
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
    fullNameController.text =
        widget.getProfileUserByIdResponeModel.fullName.toString();
    addressController.text =
        widget.getProfileUserByIdResponeModel.address.toString();
    fullName = widget.getProfileUserByIdResponeModel.address.toString();
    address = widget.getProfileUserByIdResponeModel.address.toString();
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
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    context.read<UserBloc>().add(UserEvent.setStateFlase());
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
                      context.read<UserBloc>().add(
                          UserEvent.updateProfilePatientRequest(widget.userId));
                    },
                    child: Text(
                      'Lưu',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              body: ListView(
                padding: EdgeInsets.symmetric(horizontal: 32),
                physics: BouncingScrollPhysics(),
                children: [
                  ProfileWidget(
                    imagePath: "assets/images/logo_Avatar.jpg",
                    isEdit: true,
                    onClicked: () {},
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Họ tên',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
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
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Địa chỉ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
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
