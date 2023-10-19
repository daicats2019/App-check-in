import 'package:app_check_in/untils/media_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../route/routname.dart';
import '../widget/button_login.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({Key? key}) : super(key: key);

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            Image.asset(MediaManager.logo),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppButton(


                      onPressed: () {
                        Navigator.pushNamed(context, RouteNamePage.signUpPage);
                      },
                      title: 'Sign up',
                      color: const Color(0xff73AB6B),
                      textColor: const Color(0xffffffff), icon: null,),
                  const SizedBox(height: 10,),
                   AppButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNamePage.loginpage);
                    },
                      icon: null,
                      title: 'Login',
                      color: const Color(0xffffffff),
                      textColor: Colors.black),
                  TextButton(onPressed: () {},
                      child: const Text('Forgot Password?',
                        style: TextStyle(color: Colors.black),))

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
