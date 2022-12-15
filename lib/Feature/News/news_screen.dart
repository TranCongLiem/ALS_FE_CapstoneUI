import 'package:capstone_ui/Components/BottomNavBar/bottom_nav_bar.dart';
import 'package:capstone_ui/Components/News/custom_title_list.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/CategoryNews/CategoryNews_bloc_bloc.dart';
import '../../Bloc/knowledge/knowledge_bloc.dart';
import '../../Model/getListKnowledge_model.dart';
import '../../services/api_ListKnowledge.dart';
import 'skeleton.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late bool _isLoading;
  String category_in_Session = '';
  int? tappedIndex;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    tappedIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ListKnowledgeBlocBloc(
                RepositoryProvider.of<ListKnowledgeService>(context))
              ..add(LoadListKnowledgeEvent())),
        BlocProvider(
            create: (context) => CategoryKnowledgeBlocBloc(
                RepositoryProvider.of<ListKnowledgeService>(context))
              ..add(LoadAllCategoryKnowLedge())),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20.0),
              height: MediaQuery.of(context).size.height * 0.08,
              child: Expanded(
                child: BlocBuilder<CategoryKnowledgeBlocBloc,
                    CategoryKnowledgeBlocState>(
                  builder: (context, state) {
                    if (state is CategoryKnowledgeLoadedState) {
                      return ListView(
                        physics: ClampingScrollPhysics(),
                        children: [
                          Container(
                            height: 40,
                            child: ListView.builder(
                                itemCount: state.list.length,
                                padding: EdgeInsets.only(left: 16),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  // return CustomCategoryListInSession(state.list[index], context);
                                  bool select = true;
                                  return Container(
                                    margin: EdgeInsets.only(right: 16),
                                    width: MediaQuery.of(context).size.width *
                                        0.38,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            tappedIndex = index;
                                            category_in_Session = state
                                                    .list[index]
                                                    .categoryNewId ??
                                                '';

                                            BlocProvider.of<
                                                        ListKnowledgeBlocBloc>(
                                                    context)
                                                .add(LoadKnowLedgeByCateEvent(
                                                    request: GetKnowledgeByCategoryKnowledgeIdRequest(
                                                        CategoryKnowLedeId: state
                                                                .list[index]
                                                                .categoryNewId ??
                                                            '')));
                                          });
                                        },
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.symmetric(
                                                    horizontal: 10.0)),
                                            backgroundColor: tappedIndex == index
                                                ? MaterialStateProperty.all<Color>(
                                                    greenALS)
                                                : MaterialStateProperty.all<Color>(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10.0),
                                                    side: BorderSide(color: greenALS)))),
                                        child: Text(
                                          state.list[index].categoryName ??
                                              'Sức khỏe',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          //category_in_Session = state.list[index].categoryName,
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.w400,
                                              color: tappedIndex == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                  );
                                }),
                          ),
                        ],
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                      // child: Text('a'),
                    );
                  },
                ),

                //--//oke
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(child: ListNewsByCate(context)),
          ],
        ),
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

Widget ListNewsByCate(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Expanded(child:
            BlocBuilder<ListKnowledgeBlocBloc, ListKnowledgeBlocState>(
                builder: (context, state) {
          if (state is ListKnowledgeLoadedState) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                // return CustomExerciseList(state.list[index], context);
                return customTitleList(state.list[index], context);
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
            // child: Text('a'),
          );
        })),
      ],
    ),
  );
}
