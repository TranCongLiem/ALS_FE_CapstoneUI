import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/Newsfeed/create_post.dart';
import 'package:capstone_ui/Feature/Newsfeed/customPostList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/post/post_bloc.dart';
import '../../Components/BottomNavBar/bottom_nav_bar.dart';
import '../../Model/getListPost_model.dart';
import '../../services/api_Post.dart';

class NewFeed extends StatefulWidget {
  const NewFeed({Key? key}) : super(key: key);

  @override
  State<NewFeed> createState() => _NewFeedState();
}

class _NewFeedState extends State<NewFeed> {
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
                  title: Text(
                    'Tin tức',
                    style: TextStyle(fontSize: 23),
                  ),
                  centerTitle: true,
                ),
                bottomNavigationBar: MyBottomNavBar(
                    // ignore: unnecessary_this
                    // index: this.index,
                    ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
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
                                              CreatePostNewFeed()));
                                },
                                child: Text(
                                  'Bạn đang nghĩ gì',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 24.0),
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
