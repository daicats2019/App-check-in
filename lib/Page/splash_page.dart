import 'package:app_check_in/Page/sign_up.dart';
import 'package:app_check_in/Page/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/routname.dart';
import 'home_page.dart';
import 'login_page.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  // @override
  // void initState(){
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 1), () {
  //    Navigator.pushNamed(context, RouteNamePage.welComepage);
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            } else if (snapshot.hasData) {
              return Homepage();
            }else if (snapshot.hasError) {
              return Center( child:  Text('Something Wrong!'),);
            } else {
              return Welcomepage();
            }
          }),
    );
  }
  }

