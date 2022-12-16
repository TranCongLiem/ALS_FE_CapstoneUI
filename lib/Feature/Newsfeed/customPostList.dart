import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/react_post/react_post_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../Bloc/post/post_bloc.dart';
import '../../Model/getListPost_model.dart';
import '../../services/api_Post.dart';
import 'package:readmore/readmore.dart';

class CustomPostList extends StatefulWidget {
  final List<ListPost> listPost;
  final int indexx;
  const CustomPostList({Key? key, required this.listPost, required this.indexx})
      : super(key: key);

  @override
  _CustomPostListState createState() => _CustomPostListState();
}

class _CustomPostListState extends State<CustomPostList> {
  late bool? checkReact;
  late int countReact;
  late String userId;
  late String? imageUser;
  @override
  void initState() {
    super.initState();
    onLikeButtonTapped();
    checkReact = widget.listPost[widget.indexx].checkReact;
    countReact = widget.listPost[widget.indexx].countReact ?? 0;
    imageUser = widget.listPost[widget.indexx].imageUser;
  }

  @override
  Widget build(BuildContext context) {
    DateTime time =
        DateTime.parse(widget.listPost[widget.indexx].createDate ?? '');
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context2, state2) {
        userId = state2.userId;
        return BlocProvider(
          create: (context2) =>
              PostBlocBloc(RepositoryProvider.of<PostService>(context))
                ..add(LoadPostEvent(userId: state2.userId)),
          child: Card(
            margin: EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor: greenALS,
                              child: CircleAvatar(
                                radius: 25.0,
                                backgroundColor: Colors.grey[200],
                                backgroundImage:
                                    widget.listPost[widget.indexx].imageUser !=
                                            ''
                                        ? NetworkImage(widget
                                            .listPost[widget.indexx]
                                            .imageUser!) as ImageProvider
                                        : AssetImage(
                                            'assets/images/logo_Avatar.jpg'),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.listPost[widget.indexx]
                                            .fullNameUser ??
                                        '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.0),
                                  ),
                                  Text(
                                    timeago.format(time, locale: 'vi'),
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: ReadMoreText(
                            widget.listPost[widget.indexx].caption ?? '',
                            trimLines: 2,
                            colorClickableText: greenALS.withOpacity(0.8),
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Xem thêm',
                            trimExpandedText: 'Thu gọn',
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                        widget.listPost[widget.indexx].image != null
                            ? const SizedBox.shrink()
                            : const SizedBox(height: 6.0),
                      ],
                    ),
                  ),
                  widget.listPost[widget.indexx].image != ''
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: CachedNetworkImage(
                            imageUrl:
                                widget.listPost[widget.indexx].image ?? '',
                            errorWidget: ((context, url, error) => Container(
                                  alignment: Alignment.center,
                                  height:
                                      MediaQuery.of(context).size.height * 0.3,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  color: Colors.grey[300],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.error_outline_outlined),
                                      SizedBox(
                                        width: 5.0,
                                      ),
                                      Text(
                                        'Có lỗi khi tải ảnh',
                                        style: TextStyle(fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: [
                        const Divider(),
                        Row(
                          children: [
                            Expanded(
                              child: Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: checkReact ?? false
                                              ? Row(
                                                  children: [
                                                    LikeButton(
                                                      likeCount: countReact,
                                                      onTap: (isLiked) =>
                                                          diableReactPost(
                                                              state2.userId,
                                                              widget
                                                                  .listPost[widget
                                                                      .indexx]
                                                                  .postId
                                                                  .toString()),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return SizedBox(
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 35.0,
                                                          ),
                                                        );
                                                      },
                                                      countBuilder: (likeCount,
                                                          isLiked, text) {
                                                        var color = Colors.red;
                                                        Widget result;
                                                        result = Text(
                                                          text,
                                                          style: TextStyle(
                                                              color: color,
                                                              fontSize: 24),
                                                        );
                                                        return result;
                                                      },
                                                    ),
                                                  ],
                                                )
                                              : Row(
                                                  children: [
                                                    LikeButton(
                                                      likeCount: countReact,
                                                      onTap: (isLiked) =>
                                                          enableReactPost(
                                                              state2.userId,
                                                              widget
                                                                  .listPost[widget
                                                                      .indexx]
                                                                  .postId
                                                                  .toString()),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return Icon(
                                                          Icons.favorite,
                                                          color: Colors.grey,
                                                          size: 35.0,
                                                        );
                                                      },
                                                      countBuilder: (likeCount,
                                                          isLiked, text) {
                                                        var color = Colors.grey;
                                                        Widget result;
                                                        if (countReact == 0) {
                                                          result = Text(
                                                            "Thích",
                                                            style: TextStyle(
                                                                color: color,
                                                                fontSize: 24),
                                                          );
                                                        } else
                                                          result = Text(
                                                            text,
                                                            style: TextStyle(
                                                                color: color,
                                                                fontSize: 24),
                                                          );
                                                        return result;
                                                      },
                                                    ),
                                                    const SizedBox(width: 4.0),
                                                  ],
                                                )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> enableReactPost(
    String userId,
    String postId,
  ) async {
    context
        .read<ReactPostBloc>()
        .add(ReactPostEvent.reactPostRequest(userId, postId, true));
    setState(() {
      checkReact = true;
      countReact++;
      widget.listPost[widget.indexx].checkReact = true;
      widget.listPost[widget.indexx].countReact = countReact;
    });

    return checkReact!;
  }

  void onLikeButtonTapped() {
    (context) => PostBlocBloc(RepositoryProvider.of<PostService>(context))
      ..add(LoadPostEvent(userId: userId));
  }

  Future<bool> diableReactPost(String userId, String postId) async {
    context
        .read<ReactPostBloc>()
        .add(ReactPostEvent.reactPostRequest(userId, postId, false));
    setState(() {
      checkReact = false;
      countReact--;
      widget.listPost[widget.indexx].checkReact = false;
      widget.listPost[widget.indexx].countReact = countReact;
    });

    return checkReact!;
    // return checkReact!;
  }
}
