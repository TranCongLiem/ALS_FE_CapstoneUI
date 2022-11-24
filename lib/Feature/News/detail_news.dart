import 'package:flutter/material.dart';
import '../../Model/getListKnowledge_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailKnowledgeCustom extends StatefulWidget {
  const DetailKnowledgeCustom({Key? key, required this.listKnowledge})
      : super(key: key);
  final ListKnowledge listKnowledge;
  @override
  State<DetailKnowledgeCustom> createState() => _DetailKnowledgeCustomState();
}

class _DetailKnowledgeCustomState extends State<DetailKnowledgeCustom> {
  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.listKnowledge.createDate ?? '');
    timeago.setLocaleMessages('vi', timeago.ViMessages());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Colors.green,
        backgroundColor: Color(0xffffff),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.listKnowledge.image ?? "",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    borderRadius: BorderRadius.circular(35.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20),
                          child: Text(
                            widget.listKnowledge.title ?? "",
                            style: TextStyle(
                                fontSize: 28.0, fontWeight: FontWeight.bold
                                //
                                ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 20),
                          child: Text(
                            timeago.format(time, locale: 'vi'),
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey[500]),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            widget.listKnowledge.description ?? "",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
