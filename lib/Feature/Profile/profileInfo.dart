import 'package:capstone_ui/Bloc/user_detail/user_detail_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/services/api_User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.name,
    this.image,
  }) : super(key: key);
  final String name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    //double defaultSize = SizeConfig.defaultSize;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => GetDetailBloc(
                RepositoryProvider.of<UserPatientService>(context))
              ..add(LoadDetailUserEvent())),
      ],
      child: BlocBuilder<GetDetailBloc, GetDeatailBlocState>(
        builder: (context, state) {
          if(state is GetDetailLoadedState){
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
                            image: AssetImage("assets/images/logo_Avatar.jpg"),
                          ),
                        ),
                      ),
                      Text(
                        state.getProfileUserByIdResponeModel.fullName.toString(),
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
          return Center(
                      child: CircularProgressIndicator(),
                    );
        },
      ),
    );
  }
}

class CustomeShape extends CustomClipper<Path> {
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }
}
