import 'dart:convert';

import 'package:azep_bus_app/pages/bus_lists_page.dart';
import 'package:azep_bus_app/pages/forgot_password_page.dart';
import 'package:azep_bus_app/pages/text_fields.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/login_api.dart';
import '../models/login_model.dart';
import '../routes/app_routes.dart';
import '../utils/constants.dart';
import '../utils/custom_toast_message.dart';
import '../utils/size.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  var loginRequestBody = LoginRequestBody();
  String userName = '';
  bool isButtonDisable = false;

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
            content:
                Text('Please grant location permission to use this feature.'),
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
            child: Form(
              key: globalFormKey,
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
                              onPressed: () {},
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
                    child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'UserName',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ToastMessage().message(
                                'The user name field is required.', context);
                          } else {
                            return null;
                          }
                        },
                        onChanged: (input) {
                          loginRequestBody.username = input.trim();
                        }),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0, right: 48),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ToastMessage().message(
                              'The Password field is required.', context);
                        } else {
                          return null;
                        }
                      },
                        onChanged: (input) {
                          loginRequestBody.password =
                              input.trim();
                        }
                    ),
                  ),
                  const SizedBox(
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
                                Navigator.pushNamed(
                                    context, AppRoutes.forgotPasswordPage);
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
                        onPressed: isButtonDisable
                            ? () {}
                            : (() {
                          if (loginRequestBody.password ==
                              '' ||
                              loginRequestBody.password ==
                                  null) {
                            ToastMessage().message(
                                "Please Enter Password",
                                context);
                          } else if (loginRequestBody.username == '' ||
                              loginRequestBody.username == null) {
                            ToastMessage().message(
                                "Please Enter Username",
                                context);
                          } else {
                            _loginFunction();
                          }
                        }),
                        child: Text(
                          'Next',
                          style: GoogleFonts.inter(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  isButtonDisable ? Container(
                    height: 20,
                    width: 20,
                    margin:
                    getMargin(left: 15),
                    child: Center(
                      child:
                      CircularProgressIndicator(
                        color: ColorConstant
                            .textBlack,
                      ),
                    ),
                  )
                      : const SizedBox(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginFunction() {

    setState(() {
     isButtonDisable = true;
    });
    loginRequestBody.role='Driver';
    debugPrint("MANI _loginFunction ${loginRequestBody.username}");
    if (validateAndSave()) {
      var loginAPI = LoginAPI(context: context);
      loginAPI.login(loginRequestBody).then((value) async {
        debugPrint('LOGIN API STATUS CODE: ${value.statusCode}');
        debugPrint('LOGIN API RESPONSE: ${jsonDecode(value.body)}');
        debugPrint('');

        if (value.statusCode == 200) {
          var res = LoginResponse.fromJson(jsonDecode(value.body));
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('JWT-Token', res.data!.token!);
          pref.setString('User-Id', res.data!.id!);
          pref.setString('Employee-Id', res.data!.employeeId!);
          pref.setString('LoginResponse', value.body);

          Fluttertoast.showToast(msg: res.message!);
          Navigator.pushReplacementNamed(context, AppRoutes.busListPage);
        } else {
          Fluttertoast.showToast(msg: jsonDecode(value.body)['message']);
          setState(() {
            isButtonDisable = false;
          });
        }
        setState(() {
          isButtonDisable = false;
        });
      });
    }
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
