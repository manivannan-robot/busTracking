


import 'package:azep_bus_app/utils/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToastMessage {
  message(String msg, BuildContext context) {
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.values[1],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: Colors.grey.shade900,
        content: Text(
          msg,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: getFontSize(16),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class ErrorToastMessage {
  message(String msg, BuildContext context) {
    final snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.values[1],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: Colors.red,
        content: Text(
          msg,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: getFontSize(16),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

void errorMotionToast(BuildContext context, String msg) {
  MotionToast.error(
    height: 60,
    width: 250,
    constraints: BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width * 0.75,
      minWidth: 250,
      maxHeight: 65,
    ),
    // icon: Icons.error_outline_sharp,
    iconSize: 30,
    // primaryColor: Colors.red,
    position: MotionToastPosition.top,
    animationType: AnimationType.fromLeft,
    toastDuration: const Duration(seconds: 1),
    title: const Text(
      'Error',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    dismissable: true,
    description: Text(msg),
  ).show(context);
}

class ClearCache {
  sharedPrefData() async {
    debugPrint('CACHE CLEARD');
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('JWT-Token');
    pref.remove('User-Id');
    pref.remove('Employee-Id');
    pref.remove('LoginResponse');
  }
}
