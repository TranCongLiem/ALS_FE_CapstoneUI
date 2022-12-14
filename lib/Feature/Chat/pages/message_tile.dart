import 'package:capstone_ui/Feature/Chat/providers/chat_provider.dart';
import 'package:flutter/material.dart';

import '../../../Constant/constant.dart';
import '../constants/color_constants.dart';
import 'full_photo_page.dart';

class MessageTile extends StatefulWidget {
  final String message;
  final String sender;
  final bool sentByMe;
  final int type;
  const MessageTile({
    Key? key,
    required this.message,
    required this.sender,
    required this.sentByMe,
    required this.type,
  }) : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: widget.sentByMe ? 0 : 24,
          right: widget.sentByMe ? 24 : 0),
      alignment: widget.sentByMe ? Alignment.bottomRight : Alignment.centerLeft,
      child: Container(
        margin: widget.sentByMe
            ? const EdgeInsets.only(left: 30)
            : const EdgeInsets.only(right: 30),
        padding:
            const EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: widget.sentByMe
                ? BorderRadius.circular(10)
                : BorderRadius.circular(10),
            color:
                widget.sentByMe ? Colors.grey[200] : greenALS.withOpacity(0.4)),
        child: Column(
          children: <Widget>[
            widget.type == TypeMessage.text
                ? Column(
                    children: [
                      Text(
                        widget.sender.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: -0.5),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(widget.message,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black))
                    ],
                  )
                : widget.type == TypeMessage.image
                    ? Container(
                        child: Column(
                          children: [
                            Text(
                              widget.sender.toUpperCase(),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: -0.5),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            OutlinedButton(
                              child: Material(
                                child: Image.network(
                                  widget.message,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: ColorConstants.greyColor2,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                      ),
                                      width: 200,
                                      height: 200,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: greenALS,
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, object, stackTrace) {
                                    return Material(
                                      child: Image.asset(
                                        'assets/images/img_not_available.jpeg',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                    );
                                  },
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                clipBehavior: Clip.hardEdge,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullPhotoPage(
                                      url: widget.message,
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.all(0))),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            widget.sender.toUpperCase(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                letterSpacing: -0.5),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: Image.asset(
                              'assets/images/${widget.message}.gif',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
