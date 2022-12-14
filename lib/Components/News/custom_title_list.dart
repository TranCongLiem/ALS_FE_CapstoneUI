import 'package:capstone_ui/Model/getListKnowledge_model.dart';
import 'package:capstone_ui/services/api_ListKnowledge.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../Feature/News/detail_news.dart';

Widget customTitleList(ListKnowledge listKnowledge, BuildContext context) {
  DateTime time = DateTime.parse(listKnowledge.createDate ?? '');
  timeago.setLocaleMessages('vi', timeago.ViMessages());
  return InkWell(
    onTap: () async {
      var result = await GetDetailKnowLedgeById(
          GetDetailKnowLedgeByIdRequest(newsId: listKnowledge.newsId ?? ''));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) =>
                  DetailKnowledgeCustom(listKnowledge: result))));
    },
    child: Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(5.0),
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
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.only(left: 4),
            // decoration: BoxDecoration(
            //   color: Colors.lightGreen,
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
            child: Text(
              listKnowledge.title ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            margin: EdgeInsets.only(left: 4),
            child: Row(
              children: [
                Icon(Icons.date_range),
                Text(
                  timeago.format(time, locale: 'vi'),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 17.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            margin: EdgeInsets.only(left: 4),
            child: Text(
              listKnowledge.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 22.0),
            ),
          ),
        ],
      ),
    ),
  );
}

Future<DetailKnowledgeResponse> GetDetailKnowLedgeById(
    GetDetailKnowLedgeByIdRequest request) {
  ListKnowledgeService service = ListKnowledgeService();
  var result = service.GetDetailKnowLedgeById(request);
  return result;
}
