import 'package:app_check_in/provider/google_sign_in.dart';
import 'package:app_check_in/route/route_managermnet.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Page/splash_page.dart';
//firebase

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'model/timeData.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(timaDataAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const splashPage(),
            onGenerateRoute: routeManagement,


          ),
    );
      }


  }

