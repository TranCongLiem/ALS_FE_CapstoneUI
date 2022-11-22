import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/customPostList.dart';
import 'package:capstone_ui/Feature/Supporter/Newsfeed/create_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/post/post_bloc.dart';
import '../../../Model/getListPost_model.dart';
import '../../../services/api_Post.dart';

class NewFeedSupporter extends StatefulWidget {
  const NewFeedSupporter({Key? key}) : super(key: key);

  @override
  State<NewFeedSupporter> createState() => _NewFeedSupporterState();
}

class _NewFeedSupporterState extends State<NewFeedSupporter> {
  late ScrollController controller;
  late String userId;
  late List<ListPost> listPostt = [];
  @override
  void initState() {
    super.initState();
  }

  // int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        userId = state.userId;
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PostBlocBloc(RepositoryProvider.of<PostService>(context))
                      ..add(LoadPostEvent(userId: state.userId))),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              color: greenALS,
              home: Scaffold(
                appBar: AppBar(
                  backgroundColor: greenALS,
                  title: Text('Tin tức'),
                  centerTitle: true,
                ),
                bottomNavigationBar: MyBottomNavBarSupporter(
                    // ignore: unnecessary_this
                    // index: this.index,
                    ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                        child: SizedBox(
                          child: Row(
                            children: [
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(31, 165, 159, 159),
                                    borderRadius: BorderRadius.circular(22)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                    ),
                                    Expanded(
                                        child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CreatePostNewFeedSupporter()));
                                      },
                                      child: Text(
                                        'Bạn đang nghĩ gì',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 24.0),
                                      ),
                                    )),
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      ),
                      BlocBuilder<AuthenticateBloc, AuthenticateState>(
                        builder: (context, state) {
                          return BlocBuilder<PostBlocBloc, PostBlocState>(
                            builder: (context, state) {
                              if (state is PostLoadedState) {
                                return Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: state.list.length,
                                    itemBuilder: (context, index) {
                                      listPostt.addAll(state.list);
                                      return CustomPostList(
                                        listPost: listPostt,
                                        indexx: index,
                                      );
                                    },
                                  ),
                                );
                              }
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
