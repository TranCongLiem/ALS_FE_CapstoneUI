import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constant/constant.dart';
import '../../../Model/groupChat_model.dart';
import '../utils/utilities.dart';

Widget CustomListAllGroupChat(
    ListAllGroupChat listAllGroupChat, BuildContext context) {
  return InkWell(
    onTap: () {
      if (Utilities.isKeyboardShowing()) {
        Utilities.closeKeyboard(context);
      }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ChatPage(
      //       arguments: ChatPageArguments(
      //         peerId: data?[index].userId ?? '',
      //         peerAvatar:
      //             data?[index].imageUser ?? '',
      //         peerNickname:
      //             data?[index].fullName ?? '',
      //       ),

      //     ),
      //   ),
      // );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(listAllGroupChat.groupImage ?? ''),
              maxRadius: 25,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      listAllGroupChat.groupChatName ?? '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${listAllGroupChat.totalMember}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: greenALS.withOpacity(0.6)),
              child: Text('Tham gia'),
            )
          ],
        ),
        // trailing: Text('More Info'),
      ),
    ),
  );
}
