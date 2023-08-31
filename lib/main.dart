import 'package:app_check_in/route/routname.dart';
import 'package:flutter/material.dart';

import 'Page/form_register.dart';
import 'Page/welcome_page.dart';
import 'Page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
          case RouteNamePage.mainPage:
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
        }
      },
    );
  }
}
