import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/authenticate/authenticate_bloc.dart';
import '../../../Bloc/post/post_bloc.dart';
import '../../../Constant/constant.dart';
import '../../../services/api_Post.dart';
import 'customlistpost_supporter.dart';

class ListNewsFeedSupporter extends StatefulWidget {
  const ListNewsFeedSupporter({super.key});

  @override
  State<ListNewsFeedSupporter> createState() => _ListNewsFeedSupporterState();
}

class _ListNewsFeedSupporterState extends State<ListNewsFeedSupporter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    PostBlocBloc(RepositoryProvider.of<PostService>(context))
                      ..add(LoadPostByUserIdEvent(userId: state.userId))),
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
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return CustomPostListSupporterByUserID(
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
