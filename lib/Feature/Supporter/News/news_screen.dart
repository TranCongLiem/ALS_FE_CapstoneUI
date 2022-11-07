import 'package:capstone_ui/Components/BottomNavBar_Supporter/bottom_nav_bar_supporter.dart';
import 'package:capstone_ui/Components/News/custom_title_list.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/knowledge/knowledge_bloc.dart';
import '../../../services/api_ListKnowledge.dart';

class NewsScreenSupporter extends StatefulWidget {
  const NewsScreenSupporter({Key? key}) : super(key: key);

  @override
  State<NewsScreenSupporter> createState() => _NewsScreenSupporterState();
}

class _NewsScreenSupporterState extends State<NewsScreenSupporter> {
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
        body: Container(
          child: BlocBuilder<ListKnowledgeBlocBloc, ListKnowledgeBlocState>(
              builder: (context, state) {
            if (state is ListKnowledgeLoadedState) {
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
        bottomNavigationBar: MyBottomNavBarSupporter(),
      ),
    );
  }
}
