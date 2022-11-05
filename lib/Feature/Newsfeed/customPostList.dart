import 'package:cached_network_image/cached_network_image.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../Model/getListPost_model.dart';

Widget customePostList(ListPost listPost, BuildContext context) {
  DateTime time = DateTime.parse(listPost.createDate ?? '');
  timeago.setLocaleMessages('vi', timeago.ViMessages());
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
                            listPost.fullNameUser ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20.0),
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
                    listPost.caption ?? '',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                listPost.image != null
                    ? const SizedBox.shrink()
                    : const SizedBox(height: 6.0),
              ],
            ),
          ),
          listPost.image != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: listPost.image ?? ''),
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
                        '${listPost.countReact}',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 20.0),
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
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            height: 25.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.grey[600],
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text('Thích'),
                              ],
                            ),
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
}
