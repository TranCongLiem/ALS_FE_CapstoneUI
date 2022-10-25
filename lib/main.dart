// import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:capstone_ui/Bloc/authenticate/authenticate_bloc.dart';
import 'package:capstone_ui/Bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:capstone_ui/Bloc/categoryExercise/category_exercise_bloc.dart';
import 'package:capstone_ui/Bloc/knowledge/knowledge_bloc.dart';
import 'package:capstone_ui/Components/BottomNavBar/NavItem.dart';
import 'package:capstone_ui/Components/PageRoute/route_generator.dart';
import 'package:capstone_ui/Constant/constant.dart';
import 'package:capstone_ui/services/api_CategoryExercise.dart';
import 'package:capstone_ui/services/api_Exercise.dart';
import 'package:capstone_ui/services/api_ListKnowledge.dart';
import 'package:capstone_ui/services/api_Record.dart';
import 'package:capstone_ui/services/api_login.dart';
// import 'package:capstone_ui/Splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'Bloc/exercise/exercise_bloc_bloc.dart';
import 'firebase_options.dart';
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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color.fromARGB(0, 255, 255, 255)));
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => UserService(),
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
          )
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
            create: (context) =>
                ListKnowledgeBlocBloc(RepositoryProvider.of<ListKnowledgeService>(context))
          ),

            BlocProvider(
             // create: (context) =>
                 // ExerciseBlocBloc(RepositoryProvider.of<ExerciseService>(context)),
              create: (context) => ExerciseBlocBloc(RepositoryProvider.of<ExerciseService>(context))
          ..add(LoadExerciseEvent())
             // child: Container(),
            ),
            BlocProvider(
              create: (context) => CategoryExerciseBlocBloc(RepositoryProvider.of<CategoryExerciseService>(context))
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
