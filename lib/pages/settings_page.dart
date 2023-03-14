

import 'package:azep_bus_app/pages/bus_lists_page.dart';
import 'package:azep_bus_app/pages/forgot_password_page.dart';
import 'package:azep_bus_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
             DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()=>_onBackButtonClicked(context),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,

          //Custom AppBar
          body: Column(
            children: [
              Container(
                height: 269,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: Color(0xFF4885ED),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'Settings',
                      style: GoogleFonts.inter(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 47.0,
                    ),
                    Image.asset('assets/images/Profile.png'),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        FutureBuilder<String?>(
                          future: fetchData(),
                          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {

                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {

                              String? data = snapshot.data;
                              return Text(
                                '$data',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              );
                            }
                          },
                        ),

                        const SizedBox(
                          width: 6,
                        ),
                        const Icon(Icons.edit, color: Color(0xFFF8F8F8), size: 14),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '9807654321',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                width: size.width,
                //color: Colors.grey,
                //decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.forgotPasswordPage);
                  },
                  child: Row(
                    children: [
                      Text(
                        'Change password',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: const Color(0xFF000000)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Container(
                height: 53,
                width: size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.sosPage);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SOS',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: const Color(0xFFFF0000)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
              Container(
                height: 53,
                width: size.width,
                child: TextButton(
                  onPressed: () async{
                    SharedPreferences pref=await SharedPreferences.getInstance();
                    pref.clear();
                    Navigator.pushNamed(context, AppRoutes.schoolSelectPage);

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LOG OUT',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            color: const Color(0xFFFF0000)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.grey,
              ),
            ],
          ),

          //Custom Navigation Bar
          bottomNavigationBar: Container(
            height: 93.68,
            color: const Color(0xFF4885ED),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.busListPage);
                  },
                  icon: const Icon(
                    Icons.home_filled,
                    size: 35,
                    color: Color(0xFFF8F8F8),
                  ),
                ),
                const SizedBox(
                  width: 65,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.settingsPage);
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 35,
                    color: Color(0xFFF8F8F8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
              Future<String?>? fetchData() async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? data = prefs.getString('employee_name');
                return data;
              }

              Future<bool> _onBackButtonClicked(BuildContext context) async {
                final now = DateTime.now();
                if (currentBackPressTime == null ||
                    now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
                  currentBackPressTime = now;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Press again to exit'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return false;
                }
                SystemNavigator.pop();
                return true;
              }
}
