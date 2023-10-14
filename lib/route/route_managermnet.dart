
import 'package:app_check_in/route/routname.dart';
import 'package:flutter/material.dart';
import '../Page/check_location.dart';
import '../Page/home_checkin.dart';
import '../Page/home_page.dart';
import '../Page/login_page.dart';
import '../Page/select_location.dart';
import '../Page/sign_out.dart';
import '../Page/sign_up.dart';
import '../Page/splash_page.dart';
import '../Page/welcome_page.dart';

 var routeManagement = (setting){
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
      case RouteNamePage.checklocation:
        {
          return MaterialPageRoute(builder: (context) => CheckLocation());
        }
      case RouteNamePage.selectLocation:
        {
          return MaterialPageRoute(builder: (context) => SelectLocation());
        }
      case RouteNamePage.selectLocation:
        {
          return MaterialPageRoute(builder: (context) => SelectLocation());
        }
      case RouteNamePage.homeCheckIn:
        {
          return MaterialPageRoute(builder: (context) => Homecheck());
        }
    }};

