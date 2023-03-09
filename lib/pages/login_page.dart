

import 'package:azep_bus_app/pages/bus_lists_page.dart';
import 'package:azep_bus_app/pages/forgot_password_page.dart';
import 'package:azep_bus_app/pages/text_fields.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? mobileNo;
  final usernameController = TextEditingController();
  final PassWordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    final PermissionStatus status = await Permission.location.status;

    if (status == PermissionStatus.granted) {
      // Location permission already granted
      // Do your location-related tasks here
    } else {
      // Location permission not granted
      // Ask for permission
      _askLocationPermission();
    }
  }

  Future<void> _askLocationPermission() async {
    if (await Permission.location.request().isGranted) {
      // Permission granted
      // Do your location-related tasks here
    } else {
      // Permission denied
      // Handle the case where the user denies the permission
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Location Permission Denied'),
            content: Text('Please grant location permission to use this feature.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Expanded(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 145.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(
                            0xFFAEAEAE,
                          ),
                        ),
                        child: Center(
                          child: TextButton(
                            child: Text(
                              '1',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFF4885ED),
                          ),
                          child: Center(
                            child: TextButton(
                              child: Text(
                                '2',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 190,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48),
                  child: MyTextField(
                      controller: usernameController,
                      hintText: 'UserName',
                      obscureText: false),
                ),
                SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48),
                  child: MyTextField(
                      controller: PassWordController,
                      hintText: 'Password',
                      obscureText: true),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 48.0),
                      child: Container(
                        height: 30,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                            },
                            child: Text(
                              'forgot password?',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Color(0xFF939393)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48.0, right: 48.0),
                  child: SizedBox(
                    width: size.width,
                    height: 39,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4885ED),
                      ),
                      onPressed: () async{
                        mobileNo= usernameController.text.trim();
                        SharedPreferences pref= await SharedPreferences.getInstance();
                        pref.setString("mobile_no", mobileNo.toString());

                        Navigator.pushNamed(context, AppRoutes.homePage,arguments: mobileNo);

                        Fluttertoast.showToast(msg: '$mobileNo is your mobile no');
                      },
                      child: Text(
                        'Next',
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
