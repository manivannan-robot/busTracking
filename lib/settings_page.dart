// ignore_for_file: prefer_const_constructors

import 'package:azep_bus_app/bus_lists.dart';
import 'package:azep_bus_app/forgot_password.dart';
import 'package:azep_bus_app/login_page.dart';
import 'package:azep_bus_app/sos_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
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
                  Image.asset('lib/images/Profile.png'),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Anbu Althaf',
                        style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(Icons.edit, color: Color(0xFFF8F8F8), size: 14),
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
                      SizedBox(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      'Change password',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Color(0xFF000000)),
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
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SosPage(),
                      ),
                      ((route) => route.isFirst));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SOS',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xFFFF0000)),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'LOG OUT',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Color(0xFFFF0000)),
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
          color: Color(0xFF4885ED),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BusLists(),
                      ),
                      ((route) => route.isFirst));
                },
                icon: Icon(
                  Icons.home_filled,
                  size: 35,
                  color: Color(0xFFF8F8F8),
                ),
              ),
              SizedBox(
                width: 65,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  size: 35,
                  color: Color(0xFFF8F8F8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
