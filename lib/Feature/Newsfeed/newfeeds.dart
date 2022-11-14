import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
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
                  title: Text('Tin tức'),
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
                        child: SizedBox(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.als.org/sites/default/files/styles/image_callout/public/2021-06/navigating-ALS_02-smaller.jpg?itok=hQ1BFFn0"),
                              ),
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
                                                    CreatePostNewFeed()));
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
                                        listPost: listPostt, indexx: index,
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

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 350.0,
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.als.org/sites/default/files/styles/hero_image/public/2021-06/navigating-ALS_01-smaller.jpg?h=2f03dbdf&itok=6xFToT1-"),
              ),
              title: Text("Nguyễn Văn A"),
              subtitle: Text("September 22 at 12:17 PM"),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://www.als.org/sites/default/files/styles/hero_image/public/2020-06/Hero-New-Site_08.jpg?h=be2185f4&itok=qkJVB6S9"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      color: Colors.grey,
                    ),
                    Text(
                      "Thích",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
