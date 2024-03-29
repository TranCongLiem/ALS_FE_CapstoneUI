import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/react_post/react_post_bloc.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../Bloc/update_isPublic_post/update_is_public_post_bloc.dart';
import '../../../Model/getListPost_model.dart';

class CustomPostListSupporterByUserID extends StatefulWidget {
  final ListPost listPost;
  const CustomPostListSupporterByUserID({Key? key, required this.listPost})
      : super(key: key);

  @override
  _CustomPostListSupporterByUserIDState createState() =>
      _CustomPostListSupporterByUserIDState();
}

class _CustomPostListSupporterByUserIDState
    extends State<CustomPostListSupporterByUserID> {
  late bool? checkReact;
  late int countReact;
  late bool? isPublic;
  @override
  void initState() {
    super.initState();
    checkReact = widget.listPost.checkReact;
    countReact = widget.listPost.countReact ?? 0;
    isPublic = widget.listPost.isPublic;
  }

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.listPost.createDate ?? '');
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return BlocBuilder<ReactPostBloc, ReactPostState>(
          builder: (context, state) {
            return BlocBuilder<UpdateIsPublicPostBloc, UpdateIsPublicPostState>(
              builder: (context, state3) {
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
                                      backgroundImage: widget
                                                  .listPost.imageUser !=
                                              ''
                                          ? NetworkImage(
                                                  widget.listPost.imageUser!)
                                              as ImageProvider
                                          : AssetImage(
                                              'assets/images/logo_Avatar.jpg'),
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  isPublic ?? true
                                      ? ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              PrivatePost(widget.listPost.postId
                                                  .toString());
                                            });
                                          },
                                          child: Text('Chỉ mình tôi'),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.green[300]),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              PublicPost(widget.listPost.postId
                                                  .toString());
                                            });
                                          },
                                          child: Text('Chỉ mình tôi'))
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: CachedNetworkImage(
                                    imageUrl: widget.listPost.image ?? ''),
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: BoxDecoration(
                                      color: Colors.redAccent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 4.0),
                                  Expanded(
                                    child: Text(
                                      '${countReact}',
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 20.0),
                                    ),
                                  ),
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
                                                          IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  diableReactPost(
                                                                      state2
                                                                          .userId,
                                                                      widget
                                                                          .listPost
                                                                          .postId
                                                                          .toString());
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .redAccent,
                                                                size: 28.0,
                                                              )),
                                                          const SizedBox(
                                                              width: 4.0),
                                                          Text('Thích',
                                                              style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .redAccent,
                                                              )),
                                                        ],
                                                      )
                                                    : Row(
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  enableReactPost(
                                                                      state2
                                                                          .userId,
                                                                      widget
                                                                          .listPost
                                                                          .postId
                                                                          .toString());
                                                                });
                                                              },
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .grey[600],
                                                                size: 28.0,
                                                              )),
                                                          const SizedBox(
                                                              width: 4.0),
                                                          Text(
                                                            'Thích',
                                                            style: TextStyle(
                                                                fontSize: 20.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey[600]),
                                                          ),
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
                );
              },
            );
          },
        );
      },
    );
  }

  Future<void> PublicPost(String postId) async {
    context
        .read<UpdateIsPublicPostBloc>()
        .add(UpdateIsPublicPostEvent.UpdateIsPublicPostRequest(postId, true));
    setState(() {
      isPublic = true;
    });
  }

  Future<void> PrivatePost(String postId) async {
    context
        .read<UpdateIsPublicPostBloc>()
        .add(UpdateIsPublicPostEvent.UpdateIsPublicPostRequest(postId, false));
    setState(() {
      isPublic = false;
    });
  }

  Future<void> enableReactPost(String userId, String postId) async {
    context
        .read<ReactPostBloc>()
        .add(ReactPostEvent.reactPostRequest(userId, postId, true));
    setState(() {
      checkReact = true;
      countReact++;
    });
  }

  Future<void> diableReactPost(String userId, String postId) async {
    context
        .read<ReactPostBloc>()
        .add(ReactPostEvent.reactPostRequest(userId, postId, false));
    setState(() {
      checkReact = false;
      countReact--;
    });
  }
}
