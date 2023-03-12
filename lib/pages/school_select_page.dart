// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:azep_bus_app/api/school_list_api.dart';
import 'package:azep_bus_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/school_list_model.dart';
import '../utils/constants.dart';
import '../utils/size.dart';

class SchoolSelectPage extends StatefulWidget {
  @override
  State<SchoolSelectPage> createState() => _SchoolSelectPageState();
}

class _SchoolSelectPageState extends State<SchoolSelectPage> {
  String dropdownValue = 'One';
  var schoolListAPI=SchoolListAPI();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SafeArea(
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
                          0xFF4885ED,
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
                          color: Color(0xFFAEAEAE),
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
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 220,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Text(
                      'Select School',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Color(0xFF939393),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              // Expanded(
              //   child: FutureBuilder(
              //   future: schoolListAPI.schoolList(),
              //       builder: (context, snapshot) {
              //         if (!snapshot.hasData &&
              //             snapshot.connectionState ==
              //                 ConnectionState.waiting) {
              //           return const CircularProgressIndicator();
              //         }else{
              //           var res =SchoolListResponse.fromJson(snapshot.data);
              //           return Text('${res.message}');
              //         }
              //
              //       }
              //   ),
              // ),
              const SizedBox(
                height: 30,
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
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.loginPage);

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
    );
  }


}

