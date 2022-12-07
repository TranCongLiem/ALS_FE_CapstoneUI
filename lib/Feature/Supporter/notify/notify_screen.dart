import 'package:audioplayers/notifications.dart';
import 'package:capstone_ui/Bloc/getNotificationSupporter/get_noti_supporter_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/services/api_ShortCutNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../Bloc/authenticate/authenticate_bloc.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state1) {
        return BlocProvider(
          create: (context) => NotificationBlocBloc(
              RepositoryProvider.of<ShortCutNotificationService>(context))
            ..add(
                LoadNotificationBySupporterIdEvent(supporterId: state1.userId)),
          child: Scaffold(
            appBar: AppBar(
              title: Text('Thông báo'),
              centerTitle: true,
              backgroundColor: greenALS,
              automaticallyImplyLeading: false,
            ),
            bottomNavigationBar: MyBottomNavBarSupporter(),
            body: BlocBuilder<NotificationBlocBloc, NotificationBlocState>(
              builder: (context, state) {
                if (state is NotificationLoadedState) {
                  // return ListView(
                  //   physics: ClampingScrollPhysics(),
                  //   children: [
                  //     Container(
                  //       height: 50,
                  //       child: ListView.builder(
                  //           itemCount: state.list.length,
                  //           padding: EdgeInsets.only(left: 16),
                  //           scrollDirection: Axis.vertical,
                  //           itemBuilder: (context, index) {
                  //             // return CustomCategoryListInSession(state.list[index], context);
                  //             return Column(
                  //               margin: EdgeInsets.only(right: 16),
                  //               width: 100,
                  //               child: Container(
                  //                 height: MediaQuery.of(context).size.height * 0.04,
                  //                 width: MediaQuery.of(context).size.width * 0.1,
                  //                 decoration: BoxDecoration(
                  //                     image: DecorationImage(
                  //                         image: NetworkImage(
                  //                             'https://cdn-icons-png.flaticon.com/512/1827/1827301.png'))),
                  //               ),
                  //               title: Text(
                  //                 'Nội dung được gửi từ patient',
                  //                 style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 20.0),
                  //               ),
                  //               subtitle: Text(
                  //                 'Thời gian gửi',
                  //                 style: TextStyle(color: Colors.black54),
                  //               ),
                  //             );
                  //           }),
                  //     ),
                  //   ],
                  // );
                  return ListView.separated(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/1827/1827301.png'))),
                        ),
                        title: Text( 
                          
                          " ${state.list[index].SenderName??''}" + ': ' +" ${state.list[index].title!.isEmpty?'Cần giúp đỡ' : '${state.list[index].title}'}" ,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ),                     
                        subtitle: Text(
                         // state.list[index].CreateAt ?? '',
                         TimeAgo(state.list[index].CreateAt??''),
                          style: TextStyle(color: Colors.black54),
                        ),
                        onTap: () {},
                        enabled: true,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: state.list.length,
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      },
    );
  }

  String TimeAgo(String time){
    DateTime time1 =DateTime.parse(time);
    timeago.setLocaleMessages('vi', timeago.ViMessages());
  
    return timeago.format(time1,locale: 'vi');

  }
}
