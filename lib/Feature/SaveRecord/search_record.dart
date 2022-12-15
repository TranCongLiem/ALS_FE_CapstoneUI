import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Model/getListRecordById_model.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_searchrecord.dart';

class SearchRecord extends SearchDelegate<String> {
  final String? hintText;
  SearchRecord({this.hintText});

  @override
  String? get searchFieldLabel => hintText;

  // Other overrides...
  RecordService _recordService = RecordService();

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
        return FutureBuilder<List<RecordById>>(
            future: _recordService.searchRecordById(state.userId, query: query),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<RecordById>? data = snapshot.data;
              // return ListView.builder(
              //     itemCount: data?.length,
              //     itemBuilder: (context, index) {

              //     });
              return CustomSearchRecord(
                references: data!,
                userId: state.userId,
              );
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
