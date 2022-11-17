// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/notifications.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:capstone_ui/Bloc/categoryExercise/category_exercise_bloc.dart';
import 'package:capstone_ui/Bloc/chat/chat_bloc.dart';
import 'package:capstone_ui/Bloc/create_record/create_record_bloc.dart';
import 'package:capstone_ui/Bloc/groupchat/groupchat_bloc.dart';
import 'package:capstone_ui/Bloc/knowledge/knowledge_bloc.dart';
import 'package:capstone_ui/Bloc/record/record_bloc.dart';
import 'package:capstone_ui/Bloc/record_admin/record_list_admin_bloc.dart';
import 'package:capstone_ui/Bloc/user/user_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
import 'package:capstone_ui/Components/PageRoute/route_generator.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/services/api_CategoryExercise.dart';
import 'package:capstone_ui/services/api_Exercise.dart';
import 'package:capstone_ui/services/api_ListKnowledge.dart';
import 'package:capstone_ui/services/api_Post.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:capstone_ui/services/api_ShortCutNotification.dart';
import 'package:capstone_ui/services/api_chat.dart';
import 'package:capstone_ui/services/api_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:capstone_ui/Splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'Bloc/authenticate/create_sos_noti/create_sos_noti_bloc.dart';
import 'Bloc/create_post/create_post_bloc.dart';

import 'Bloc/bottom_nav_bar_supporter/bottom_nav_bar_supporter_bloc.dart';

import 'Bloc/exercise/exercise_bloc_bloc.dart';
import 'Bloc/list_group_chat/list_group_chat_bloc.dart';
import 'Bloc/list_group_chat_hasjoin/list_group_chat_hasjoin_bloc.dart';
import 'Bloc/post/post_bloc.dart';
import 'Bloc/pushnotisupporter/push_noti_to_supporter_bloc.dart';
import 'Bloc/react_post/react_post_bloc.dart';
import 'Bloc/remove_record/remove_record_bloc.dart';
import 'Bloc/update_isPublic_post/update_is_public_post_bloc.dart';
import 'Bloc/user_chat/user_chat_bloc.dart';
import 'Bloc/user_detail/user_detail_bloc.dart';
import 'Feature/Chat/providers/chat_provider.dart';
import 'Feature/Chat/providers/home_provider.dart';
import 'firebase_options.dart';
import 'services/api_ReactPost.dart';
import 'services/api_User.dart';
import 'services/api_groupchat.dart';
// import 'Login/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final SharedPreferences prefs;
  MyApp({Key? key, required this.prefs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.getToken().then((value) => print("TokenOfDevice:${value}" ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color.fromARGB(0, 255, 255, 255)));
    return MultiProvider(
      providers: [
        Provider<HomeProvider>(
          create: (_) => HomeProvider(
            firebaseFirestore: this.firebaseFirestore,
          ),
        ),
        Provider<ChatProvider>(
          create: (_) => ChatProvider(
            prefs: this.prefs,
            firebaseFirestore: this.firebaseFirestore,
            firebaseStorage: this.firebaseStorage,
          ),
        ),
        RepositoryProvider(
          create: (context) => PostService(),
        ),
        RepositoryProvider(
          create: (context) => ShortCutNotificationService(),
        )
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserService(),
          ),
          RepositoryProvider(
            create: (context) => UserPatientService(),
          ),
          RepositoryProvider(
            create: (context) => ExerciseService(),
          ),
          RepositoryProvider(
            create: (context) => CategoryExerciseService(),
          ),
          RepositoryProvider(
            create: (context) => RecordService(),
          ),
          RepositoryProvider(
            create: (context) => ListKnowledgeService(),
          ),
          RepositoryProvider(
            create: (context) => PostService(),
          ),
          RepositoryProvider(
            create: (context) => ReactPostService(),
          ),
          RepositoryProvider(
            create: (context) => ChatService(),
          ),
          RepositoryProvider(
            create: (context) => GroupChatService(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  BottomNavBarBloc()..add(BottomNavBarItemSelected(0)),
            ),
            BlocProvider(
              create: (context) =>
                  AuthenticateBloc(RepositoryProvider.of<UserService>(context)),
            ),
            BlocProvider(
                create: (context) => UserBloc(
                    RepositoryProvider.of<UserPatientService>(context))),
            BlocProvider(
                create: (context) => GetDetailBloc(
                    RepositoryProvider.of<UserPatientService>(context))),
            BlocProvider(
                create: (context) => ListKnowledgeBlocBloc(
                    RepositoryProvider.of<ListKnowledgeService>(context))),
            BlocProvider(
                create: (context) =>
                    PostBlocBloc(RepositoryProvider.of<PostService>(context))),
            BlocProvider(
                create: (context) => ReactPostBloc(
                    RepositoryProvider.of<ReactPostService>(context))),
            BlocProvider(
                create: (context) => CreatePostBloc(
                    RepositoryProvider.of<PostService>(context))),
            BlocProvider(
                create: (context) => UpdateIsPublicPostBloc(
                    RepositoryProvider.of<PostService>(context))),
            BlocProvider(
              create: (context) => CreateRecordBloc(
                  RepositoryProvider.of<RecordService>(context)),
            ),
            BlocProvider(
              create: (context) => RemoveRecordBloc(
                  RepositoryProvider.of<RecordService>(context)),
            ),
            BlocProvider(
              create: (context) => RecordAdminBloc(
                  RepositoryProvider.of<RecordService>(context)),
            ),
            BlocProvider(
              create: (context) =>
                  RecordBlocBloc(RepositoryProvider.of<RecordService>(context)),
            ),
            BlocProvider(
                create: (context) => ExerciseBlocBloc(
                    RepositoryProvider.of<ExerciseService>(context))
                  ..add(LoadAllExerciseEvent())),
            BlocProvider(
                create: (context) => CategoryExerciseBlocBloc(
                    RepositoryProvider.of<CategoryExerciseService>(context))),
            BlocProvider(
                create: (context) => ExerciseBlocBloc(
                    RepositoryProvider.of<ExerciseService>(context))
                  ..add(LoadAllExerciseEvent())),
            BlocProvider(
                create: (context) => CategoryExerciseBlocBloc(
                    RepositoryProvider.of<CategoryExerciseService>(context))),
            //---SUPORTER---
            BlocProvider(
              create: (context) => BottomNavBarSupporterBloc()
                ..add(BottomNavBarSupporterItemSelected(0)),
            ),
            BlocProvider(
              create: (context) => BottomNavBarSupporterBloc()
                ..add(BottomNavBarSupporterItemSelected(0)),
            ),
            BlocProvider(
              create: (context) =>
                  AuthenticateBloc(RepositoryProvider.of<UserService>(context)),
            ),

            BlocProvider(
              create: (context) =>
                  ChatBloc(RepositoryProvider.of<ChatService>(context)),
            ),
            BlocProvider(
              create: (context) =>
                  UserChatBloc(RepositoryProvider.of<ChatService>(context)),
            ),
             BlocProvider(
              create: (context) =>
                  ListGroupChatBloc(RepositoryProvider.of<GroupChatService>(context)),
            ),
            BlocProvider(
              create: (context) =>
                  ListGroupChatHasJoinBloc(RepositoryProvider.of<GroupChatService>(context)),
            ),
            BlocProvider(
              create: (context) =>
                  GroupchatBloc(RepositoryProvider.of<GroupChatService>(context))),

             BlocProvider(
              create: (context) =>
                  PushNotiToSupporterBloc(RepositoryProvider.of<ShortCutNotificationService>(context)),                 
            ),
             BlocProvider(
              create: (context) =>
                  CreateSosNotiBloc(RepositoryProvider.of<UserPatientService>(context)),
                  

            ),
          ],
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.green,
              fontFamily: 'San',
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            onGenerateRoute: RouteGenerator.generateRoute,
          ),
        ),
      ),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Image.asset('assets/images/logo_ALS.png', width: 450,),
//           ],
//         ),
//       ),
//       nextScreen: LoginScreen(),
//       splashIconSize: 200,
//       duration: 3000,
//       splashTransition: SplashTransition.slideTransition,
//     );
//   }
// }
