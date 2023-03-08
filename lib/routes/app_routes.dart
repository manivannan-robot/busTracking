

import 'package:azep_bus_app/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';
import '../pages/login_page.dart';


class AppRoutes {
  static const String splashScreen = '/';
  static const String loginPage = '/login_page';
  static const String homePage='/home_page';
  static const String schoolSelectPage='/school_select_page';


  static Map<String, WidgetBuilder> routes = {
    splashScreen:(context)=> SplashScreen(),
    loginPage:(context)=>LoginPage(),
    homePage:(context)=>HomePage(),




  };
}



