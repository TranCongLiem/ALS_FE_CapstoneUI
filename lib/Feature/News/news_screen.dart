import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
import 'package:capstone_ui/Components/News/custom_title_list.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/News/article_screen.dart';
import 'package:capstone_ui/Feature/News/model/article_model.dart';
import 'package:capstone_ui/services/api_services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/knowledge/knowledge_bloc.dart';
import '../../services/api_ListKnowledge.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // int index = 2;

  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
              create: (context) => ListKnowledgeBlocBloc(
                  RepositoryProvider.of<ListKnowledgeService>(context))
                ..add(LoadListKnowledgeEvent())),
        ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: greenALS,
          title: Text(
            "Kiến thức",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        // body: FutureBuilder(
        //   future: client.getArticle(),
        //   builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        //     if (snapshot.hasData) {
        //       List<Article>? articles = snapshot.data;
    
        //       return ListView.builder(
        //         itemCount: articles!.length,
        //         itemBuilder: (context, index) {
        //           return customTitleList(articles[index], context);
        //         },
        //       );
        //     }
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        body: Container(
                  child: BlocBuilder<ListKnowledgeBlocBloc, ListKnowledgeBlocState>(
                      builder: (context, state) {
                    print('abc' + state.toString());
                    if (state is ListKnowledgeLoadedState) {
                      print('Print ExState');
    
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return customTitleList(state.list[index], context);
                        },
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
                ),
        bottomNavigationBar: MyBottomNavBar(
            // index: this.index,
            ),
      ),
    );
  }
}
