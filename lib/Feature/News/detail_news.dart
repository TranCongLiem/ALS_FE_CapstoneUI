import 'package:capstone_ui/Feature/News/model/article_model.dart';
import 'package:flutter/material.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
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
            Image.network(article.urlToImage ?? "",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height*0.5,
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            article.title ?? "",
                            style: TextStyle(
                              fontSize: 30.0,
                              //
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            article.description ?? "",
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
