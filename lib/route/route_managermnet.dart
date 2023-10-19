
import 'package:app_check_in/route/routname.dart';
import 'package:flutter/material.dart';
import '../pages/check_location.dart';
import '../pages/home_checkin.dart';
import '../pages/home_page.dart';
import '../pages/login_page/login_page.dart';
import '../pages/select_location.dart';
import '../pages/sign_out.dart';
import '../pages/sign_up.dart';
import '../pages/splash_page.dart';
import '../pages/welcome_page.dart';

 var routeManagement = (setting){
    switch (setting.name){
      case RouteNamePage.splashPage:
        {
          return MaterialPageRoute(builder: (context) => const SplashPage());
        }
      case RouteNamePage.welcomePage:
        {
          return MaterialPageRoute(builder: (context) => const Welcomepage());
        }
      case RouteNamePage.signUpPage:
        {
          return MaterialPageRoute(builder: (context) => const SingUpPage());
        }
      case RouteNamePage.loginpage:
        {
          return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      case RouteNamePage.signOutPAge:
        {
          return MaterialPageRoute(builder: (context) => const SignOutPage());
        }
      case RouteNamePage.homePage:
        {
          return MaterialPageRoute(builder: (context) => const Homepage());
        }
      case RouteNamePage.checklocation:
        {
          return MaterialPageRoute(builder: (context) => const CheckLocation());
        }
      case RouteNamePage.selectLocation:
        {
          return MaterialPageRoute(builder: (context) => const SelectLocation());
        }
      case RouteNamePage.homeCheckIn:
        {
          return MaterialPageRoute(builder: (context) => const Homecheck());
        }
    }};

