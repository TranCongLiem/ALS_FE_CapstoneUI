import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/record/record_bloc.dart';
import 'package:capstone_ui/Bloc/record_admin/record_list_admin_bloc.dart';
import 'package:capstone_ui/Components/Feature/Excerise/SaveRecord/category_list_savevoice.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/Feature/SaveRecord/cloud_record_list_view_admin.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:capstone_ui/Feature/SaveRecord/SaveRecording.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../Home/home.dart';
import 'cloud_record_list_view.dart';
import 'search_record.dart';

class HomeViewRecord extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeViewRecordState createState() => _HomeViewRecordState();
}

class _HomeViewRecordState extends State<HomeViewRecord>
    with TickerProviderStateMixin {
  List<Reference> references = [];
  late String userId;
  @override
  void initState() {
    super.initState();
    //_onUploadComplete();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    var size = MediaQuery.of(context).size;
    return BlocBuilder<AuthenticateBloc, AuthenticateState>(
      builder: (context, state2) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => RecordBlocBloc(
                    RepositoryProvider.of<RecordService>(context))
                  ..add(LoadRecordEvent(userId: state2.userId))),
            BlocProvider(
                create: (context) => RecordAdminBloc(
                    RepositoryProvider.of<RecordService>(context))
                  ..add(LoadRecordAdminEvent())),
          ],
          child: Sizer(builder: (context, orientation, deviceType) {
            return SizerUtil.deviceType == DeviceType.mobile
                // ignore: sized_box_for_whitespace
                ? Container(
                    width: 100.w,
                    height: 20.5.h,
                    child: Scaffold(
                        appBar: AppBar(
                          toolbarHeight:
                              MediaQuery.of(context).size.height * 0.08,
                          title: Text(
                            'Hỗ trợ ghi âm',
                            style: TextStyle(fontSize: 26),
                          ),
                          backgroundColor: greenALS,
                          centerTitle: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0))),
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
                                      MaterialPageRoute(
                                          builder: (context) => Home()),
                                    )),
                          ),
                          actions: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.height * 0.05,
                              margin: EdgeInsets.only(right: 15.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: IconButton(
                                onPressed: () {
                                  showSearch(
                                      context: context,
                                      delegate:
                                          SearchRecord(hintText: 'Tìm kiếm'));
                                },
                                icon: Icon(
                                  Icons.search_sharp,
                                  color: Colors.black,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                        body: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ButtonCreateRecord(),
                                Container(
                                  alignment: Alignment.center,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    elevation: 5,
                                    child: TabBar(
                                      labelPadding:
                                          EdgeInsets.symmetric(horizontal: 40),
                                      indicator: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: greenALS),
                                      controller: tabController,
                                      isScrollable: true,
                                      tabs: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Tab(
                                            child: Text(
                                              "Mẫu",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 69, 57, 57),
                                                  fontSize: 26.0),
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Text(
                                            "Thêm",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 26.0),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: TabBarView(
                                        controller: tabController,
                                        children: [
                                      BlocBuilder<RecordAdminBloc,
                                              RecordAdminBlocState>(
                                          builder: (context, state) {
                                        if (state is RecordLoadedAdminState) {
                                          return CloudRecordListViewAdmin(
                                            references: state.list,
                                            userId: state2.userId,
                                          );
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }),
                                      BlocBuilder<RecordBlocBloc,
                                              RecordBlocState>(
                                          builder: (context, state) {
                                        if (state is RecordLoadedState) {
                                          return CloudRecordListView(
                                            references: state.list,
                                            userId: state2.userId,
                                          );
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      })
                                    ])),
                              ],
                            ),
                          ),
                        )))
                : Container(
                    width: 100.w,
                    height: 12.5.h,
                    child: Scaffold(
                        body: Stack(
                      children: <Widget>[
                        SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    childAspectRatio: .85,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    children: <Widget>[
                                      CategoryListSaveRecord(
                                        name: "Tập thể dục",
                                        svgSrc:
                                            'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                        press: () {},
                                      ),
                                      CategoryListSaveRecord(
                                        name: "Tập thể dục",
                                        svgSrc:
                                            'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                        press: () {},
                                      ),
                                      CategoryListSaveRecord(
                                        name: "Tập thể dục",
                                        svgSrc:
                                            'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                        press: () {},
                                      ),
                                      CategoryListSaveRecord(
                                        name: "Tập thể dục",
                                        svgSrc:
                                            'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                                        press: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )));
          }),
        );
      },
    );
  }

  Future<void> _onUploadComplete() async {
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    ListResult listResult =
        await firebaseStorage.ref().child('upload-voice-firebase').list();

    //upload-voice-firebase/sdasda.acc
    //Reference (Reference(app: [DEFAULT], fullPath: upload-voice-firebase/1663767506989.aac))
    //List (4 items)
    //Reference (Reference(app: [DEFAULT], fullPath: upload-voice-firebase/1663768654568.aac)))
    //Reference (Reference(app: [DEFAULT], fullPath: upload-voice-firebase/1663902562667.aac))
    //Reference (Reference(app: [DEFAULT], fullPath: upload-voice-firebase/1664174901085.aac))

    print(
        firebaseStorage.ref().child('upload-voice-firebase').list().toString());

    print(listResult);

    setState(() {
      references = listResult.items;
    });
    setState(() {});
  }
}

class ButtonCreateRecord extends StatelessWidget {
  const ButtonCreateRecord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        alignment: Alignment.center,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SaveRecording()));
          },
          label: Text(
            'Tạo bản ghi',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: Icon(Icons.add),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed) ||
                  (states.contains(MaterialState.disabled))) {
                return 0;
              }
              return 5;
            }),
            padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              (Set<MaterialState> states) {
                return EdgeInsets.all(10);
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildImageCard() => SingleChildScrollView(
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Ink.image(
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        child: InkWell(
                          onTap: () {},
                        ),
                        image: NetworkImage(
                          'https://media.istockphoto.com/photos/asian-mother-and-daughters-picture-id1356124817?s=612x612',
                        )),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow_rounded,
                        size: 30.0,
                      ),
                      label: Text(''),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(15),
                        //backgroundColor: greenALS,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tập thể dục',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );

// return MultiBlocProvider(
//       providers: [
//         // BlocProvider(
//         //     create: (context) =>
//         //         RecordTestBloc(RepositoryProvider.of<RecordService>(context))
//         //             //.read<RecordTestBloc>().add(RecordTestEvent.LoadedRecord())))),
//         //             ..add((RecordTestEvent()))),
//         // BlocProvider(
//         //     create: (context) =>
//         //         RecordAdminBloc(RepositoryProvider.of<RecordService>(context))
//         //           ..add(LoadRecordAdminEvent())),         
//       ],