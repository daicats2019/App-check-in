import 'package:app_check_in/route/routname.dart';
import 'package:flutter/material.dart';

import 'Page/home_page.dart';
import 'Page/login_page.dart';
import 'Page/sign_out.dart';
import 'Page/sign_up.dart';
import 'Page/welcome_page.dart';
import 'Page/splash_page.dart';
//firebase

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const splashPage(),
          onGenerateRoute: (setting) {
            switch (setting.name){
              case RouteNamePage.splashPage:
                {
                  return MaterialPageRoute(builder: (context) => splashPage());
                }
              case RouteNamePage.welComepage:
                {
                  return MaterialPageRoute(builder: (context) => Welcomepage());
                }
              case RouteNamePage.signUpPage:
                {
                  return MaterialPageRoute(builder: (context) => SingUpPage());
                }
              case RouteNamePage.loginpage:
                {
                  return MaterialPageRoute(builder: (context) => LoginPage());
                }
              case RouteNamePage.signOutPAge:
                {
                  return MaterialPageRoute(builder: (context) => SignOutPage());
                }
              case RouteNamePage.homePage:
                {
                  return MaterialPageRoute(builder: (context) => Homepage());
                }
            }
          },
        );
      },

    );
  }
}
