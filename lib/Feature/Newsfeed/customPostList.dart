import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/react_post/react_post_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../Model/getListPost_model.dart';

class CustomPostList extends StatefulWidget {
  final ListPost listPost;
  const CustomPostList({Key? key, required this.listPost}) : super(key: key);

  @override
  _CustomPostListState createState() => _CustomPostListState();
}

class _CustomPostListState extends State<CustomPostList> {
  late bool? checkReact;
  late int countReact;
  @override
  void initState() {
    super.initState();
    checkReact = widget.listPost.checkReact;
    countReact = widget.listPost.countReact ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.listPost.createDate ?? '');
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocBuilder<ReactPostBloc, ReactPostState>(
          builder: (context, state) {
            return Card(
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
                                radius: 20.0,
                                backgroundColor: greenALS,
                                child: CircleAvatar(
                                  radius: 17.0,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: CachedNetworkImageProvider(
                                      "https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg"),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.listPost.fullNameUser ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      timeago.format(time, locale: 'vi'),
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12.0,
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
                            child: Text(
                              widget.listPost.caption ?? '',
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                          widget.listPost.image != null
                              ? const SizedBox.shrink()
                              : const SizedBox(height: 6.0),
                        ],
                      ),
                    ),
                    widget.listPost.image != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CachedNetworkImage(
                              imageUrl: widget.listPost.image ?? '',
                              errorWidget: ((context, url, error) => Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    color: Colors.grey[300],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          Row(
                            children: [
                              // Container(
                              //   padding: const EdgeInsets.all(4.0),
                              //   decoration: BoxDecoration(
                              //     color: Colors.redAccent,
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: const Icon(
                              //     Icons.favorite,
                              //     size: 20.0,
                              //     color: Colors.white,
                              //   ),
                              // ),
                              // const SizedBox(width: 4.0),
                              // Expanded(
                              //   child: Text(
                              //     '${countReact}',
                              //     style: TextStyle(
                              //         color: Colors.grey[600], fontSize: 20.0),
                              //   ),
                              // ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: Material(
                                  color: Colors.white,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                              widget.listPost
                                                                  .postId
                                                                  .toString()),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return Icon(
                                                          Icons.favorite,
                                                          color: Colors.red,
                                                          size: 26.0,
                                                        );
                                                      },
                                                      countBuilder:
                                                          (likeCount, isLiked,
                                                              text) {
                                                        var color =
                                                            Colors.red;
                                                        Widget result;
                                                        result = Text(
                                                          text,
                                                          style: TextStyle(
                                                              color: color),
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
                                                              widget.listPost
                                                                  .postId
                                                                  .toString()),
                                                      likeBuilder:
                                                          (bool isLiked) {
                                                        return Icon(
                                                          Icons.favorite,
                                                          color: Colors.grey,
                                                          size: 26.0,
                                                        );
                                                      },
                                                      countBuilder:
                                                          (likeCount, isLiked,
                                                              text) {
                                                        var color =
                                                            Colors.grey;
                                                        Widget result;
                                                        if (countReact == 0) {
                                                          result = Text(
                                                            "Thích",
                                                            style: TextStyle(
                                                                color: color),
                                                          );
                                                        } else
                                                          result = Text(
                                                            text,
                                                            style: TextStyle(
                                                                color: color),
                                                          );
                                                        return result;
                                                      },
                                                    ),
                                                    const SizedBox(
                                                        width: 4.0),
                                                  ],
                                                )
                                          // child: LikeButton(
                                          //   likeCount: countReact,
                                          //   onTap: (checkReact) =>
                                          //       enableReactPost(
                                          //           state2.userId,
                                          //           widget.listPost.postId
                                          //               .toString()),
                                          //   likeBuilder: (isLike) {
                                          //     return Icon(
                                          //       Icons.favorite,
                                          //       color: checkReact!
                                          //           ? Colors.red
                                          //           : Colors.grey,
                                          //       size: 26.0,
                                          //     );
                                          //   },
                              
                                          //   countBuilder:
                                          //       (likeCount, isLike, text) {
                                          //     var color = checkReact!
                                          //         ? Colors.red
                                          //         : Colors.grey;
                                          //     Widget result;
                                          //     if (countReact == 0) {
                                          //       result = Text(
                                          //         "Thích",
                                          //         style:
                                          //             TextStyle(color: color),
                                          //       );
                                          //     } else
                                          //       result = Text(
                                          //         text,
                                          //         style:
                                          //             TextStyle(color: color),
                                          //       );
                                          //     return result;
                                          //   },
                                          // ),
                                        ),
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
            );
          },
        );
      },
    );
  }

  Future<bool> enableReactPost(
    String userId,
    String postId,
  ) async {
    // if (checkReact == true) {
    //   context
    //       .read<ReactPostBloc>()
    //       .add(ReactPostEvent.reactPostRequest(userId, postId, false));
    //   setState(() {
    //     checkReact = false;
    //     countReact--;
    //   });

    //   return checkReact!;
    // } else {
    //   context
    //       .read<ReactPostBloc>()
    //       .add(ReactPostEvent.reactPostRequest(userId, postId, true));
    //   setState(() {
    //     checkReact = true;
    //     countReact++;
    //   });
    //   return checkReact!;
    // }
    context
          .read<ReactPostBloc>()
          .add(ReactPostEvent.reactPostRequest(userId, postId, true));
      setState(() {
        checkReact = true;
        countReact++;
      });

      return checkReact!;
  }

  Future<bool?> onLikeButtonTapped(bool isLikedd) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLikedd;
  }

  Future<bool> diableReactPost(String userId, String postId) async {
    context
          .read<ReactPostBloc>()
          .add(ReactPostEvent.reactPostRequest(userId, postId, false));
      setState(() {
        checkReact = false;
        countReact--;
      });

      return checkReact!;
    // return checkReact!;
  }
}
