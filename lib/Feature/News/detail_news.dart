import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import '../../Model/getListKnowledge_model.dart';
import 'news_screen.dart';

class DetailKnowledgeCustom extends StatefulWidget {
  const DetailKnowledgeCustom({Key? key, required this.listKnowledge})
      : super(key: key);
  //final ListKnowledge listKnowledge;
  final DetailKnowledgeResponse listKnowledge;

  @override
  State<DetailKnowledgeCustom> createState() => _DetailKnowledgeCustomState();
}

class _DetailKnowledgeCustomState extends State<DetailKnowledgeCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Chi tiết kiến thức',
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: greenALS,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsScreen()),
                    )),
          )),
      body: Center(
        // Image.network(
        //   widget.listKnowledge.image ?? "",
        //   fit: BoxFit.cover,
        //   height: MediaQuery.of(context).size.height * 0.5,
        //   width: MediaQuery.of(context).size.width,
        // ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.listKnowledge.title ?? "",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w500
                    //
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.topLeft,
              child: Text(
                widget.listKnowledge.description ?? "",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.listKnowledge.newsDetail?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.listKnowledge.newsDetail?[index]
                                      .headerName ??
                                  "Tiêu đề",
                              style: TextStyle(
                                  fontSize: 28.0, fontWeight: FontWeight.w400
                                  //
                                  ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              widget.listKnowledge.newsDetail?[index]
                                      .descriptionHeader ??
                                  "Mô tả",
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.w300),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          widget.listKnowledge.newsDetail?[index].imageHeader !=
                                  ''
                              ? Image.network(
                                  widget.listKnowledge.newsDetail?[index]
                                          .imageHeader ??
                                      "",
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width: MediaQuery.of(context).size.width,
                                )
                              : SizedBox.shrink()
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
