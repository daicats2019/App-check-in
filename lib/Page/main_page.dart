import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/routname.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
     Navigator.pushNamed(context, RouteNamePage.welComepage);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
              onTap: (){
                Navigator.pushNamed(context, RouteNamePage.mainPage);
              },
              child: Image.asset('assets/images/spectrum_logo.png')),
        ],
      ),
    );
  }
}
