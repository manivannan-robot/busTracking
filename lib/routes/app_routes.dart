

import 'package:azep_bus_app/pages/bus_lists_page.dart';
import 'package:azep_bus_app/pages/home_page.dart';
import 'package:azep_bus_app/pages/settings_page.dart';
import 'package:azep_bus_app/pages/sos_page.dart';
import 'package:flutter/cupertino.dart';


import '../main.dart';
import '../pages/forgot_password_page.dart';
import '../pages/login_page.dart';
import '../pages/school_select_page.dart';


class AppRoutes {
  static const String splashScreen = '/';
  static const String loginPage = '/login_page';
  static const String homePage='/home_page';
  static const String busListPage='/bus_list_page';
  static const String schoolSelectPage='/school_select_page';
  static const String forgotPasswordPage='/forgot_password_page';
  static const String settingsPage='/settings_page';
  static const String sosPage='/sos_page';



  static Map<String, WidgetBuilder> routes = {
    splashScreen:(context)=> SplashScreen(),
    loginPage:(context)=>LoginPage(),
    homePage:(context)=>HomePage(),
    busListPage:(context)=>BusLists(),
    schoolSelectPage:(context)=>SchoolSelectPage(),
    forgotPasswordPage:(context)=>ForgotPasswordPage(),
    settingsPage:(context)=>SettingsPage(),
    sosPage:(context)=>SosPage(),





  };
}



