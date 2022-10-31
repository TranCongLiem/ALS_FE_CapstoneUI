import 'package:capstone_ui/Feature/News/article_screen.dart';
import 'package:capstone_ui/Model/getDetailKnowledge_model.dart';
import 'package:capstone_ui/Model/getListKnowledge_model.dart';
import 'package:flutter/material.dart';

import '../../Feature/News/detail_news.dart';

Widget customTitleList(ListKnowledge listKnowledge, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  DetailKnowledgeCustom(listKnowledge: listKnowledge))));
    },
    child: Container(
      margin: EdgeInsets.all(15.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(listKnowledge.image ?? ''),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              listKnowledge.title ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            listKnowledge.title ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ],
      ),
    ),
  );
}
