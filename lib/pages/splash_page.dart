import 'package:flutter/material.dart';

import '../route/routname.dart';
import '../untils/media_manager.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Navigator.pushNamed(context, RouteNamePage.loginpage);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Image.asset(MediaManager.logo),
    ));
  }
}
