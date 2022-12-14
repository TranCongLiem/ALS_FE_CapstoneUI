import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
import 'package:capstone_ui/Components/News/custom_title_list.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/knowledge/knowledge_bloc.dart';
import '../../services/api_ListKnowledge.dart';
import 'skeleton.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // int index = 2;
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

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
        body: BlocBuilder<ListKnowledgeBlocBloc, ListKnowledgeBlocState>(
            builder: (context, state) {
          if (state is ListKnowledgeLoadedState) {
            return Padding(
                padding: const EdgeInsets.all(4.0),
                child: _isLoading
                    ? ListView.separated(
                        itemBuilder: (context, index) =>
                            const NewsCardSkelton(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: defaultPadding),
                        itemCount: 5)
                    : ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: defaultPadding),
                        scrollDirection: Axis.vertical,
                        itemCount: state.list.length,
                        itemBuilder: (context, index) {
                          return customTitleList(state.list[index], context);
                        },
                      ));
          }
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.separated(
                itemBuilder: (context, index) => const NewsCardSkelton(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: defaultPadding),
                itemCount: 5),
          );
        }),
        bottomNavigationBar: MyBottomNavBar(
            // index: this.index,
            ),
      ),
    );
  }
}

class NewsCardSkelton extends StatelessWidget {
  const NewsCardSkelton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Skeleton(height: 120, width: 120),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Skeleton(width: 80),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              const Skeleton(),
              const SizedBox(height: defaultPadding / 2),
              Row(
                children: const [
                  Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
