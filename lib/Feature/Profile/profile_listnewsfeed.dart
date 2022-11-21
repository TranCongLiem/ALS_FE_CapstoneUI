import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/authenticate/authenticate_bloc.dart';
import '../../Bloc/post/post_bloc.dart';
import '../../Constant/constant.dart';
import '../../services/api_Post.dart';
import 'customlistpost.dart';


class ListNewsFeed extends StatefulWidget {
  const ListNewsFeed({super.key});

  @override
  State<ListNewsFeed> createState() => _ListNewsFeedState();
}

class _ListNewsFeedState extends State<ListNewsFeed> {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PostBlocBloc(RepositoryProvider.of<PostService>(context))
                      ..add(LoadPostEvent(userId: state.userId))),
          ],
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: greenALS,
              title: Text(
                'Lịch sử',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            body: BlocBuilder<PostBlocBloc, PostBlocState>(
              builder: (context, state) {
                if (state is PostLoadedState) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CustomPostListByUserID(
                        listPost: state.list[index],
                      );
                    },
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
}
