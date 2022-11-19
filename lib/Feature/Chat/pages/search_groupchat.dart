import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/groupchat/groupchat_bloc.dart';
import 'package:capstone_ui/Feature/Chat/pages/custom_searchgroup.dart';
import 'package:capstone_ui/Model/getListChat_model.dart';
import 'package:capstone_ui/Model/groupChat_model.dart';
import 'package:capstone_ui/services/api_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../Constant/constant.dart';
import '../../../services/api_groupchat.dart';
import '../constants/color_constants.dart';
import '../utils/utilities.dart';
import 'chat_page.dart';

class SearchGroup extends SearchDelegate<String> {
  final String? hintText;
  SearchGroup({this.hintText});
  @override
  String? get searchFieldLabel => hintText;

  // Other overrides...
  GroupChatService _groupList = GroupChatService();
  
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state) {
        return FutureBuilder<List<ListAllGroupChat>>(
            future:
                _groupList.getAllGroupChatSearch(state.userId, query: query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<ListAllGroupChat>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index) {
                    return CustomSearchGroup(listAllGroupChat: data![index], userId: state.userId,);
                  });
            });
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(''),
    );
  }

   
}
