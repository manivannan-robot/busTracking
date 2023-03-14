// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:azep_bus_app/api/school_list_api.dart';
import 'package:azep_bus_app/models/trip_starting_arguments.dart';
import 'package:azep_bus_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/school_list_model.dart';
import '../utils/constants.dart';
import '../utils/size.dart';

class SchoolSelectPage extends StatefulWidget {
  @override
  State<SchoolSelectPage> createState() => _SchoolSelectPageState();
}

class _SchoolSelectPageState extends State<SchoolSelectPage> {

  List<SchoolListResponseData?>? schoolList;
  String? selectedSchool;
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    getSchoolListFunction();
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

                 Padding(
                   padding: EdgeInsets.only(left:48,right: 48),
                   child: Container(
                     decoration: BoxDecoration(
                         border: Border.all(
                           color: Color(0xFF939393),
                         ),
                         borderRadius: BorderRadius.circular(5)),
                     child: Padding(
                       padding: EdgeInsets.only(left: 8,right: 8),
                       child: Row(
                         children: [
                           Expanded(child: DropdownButtonHideUnderline(
                             child: DropdownButton<String>(
                               hint: Text('Select School'),
                               value: selectedSchool,
                               items:schoolList?.map((item) {
                                 print(item);
                                 return DropdownMenuItem(
                                   value: item?.schoolId,
                                   child:Text(item!.schoolName!),
                                 );
                               }).toList(),
                               onChanged: (value) {
                                 saveSelectedSchool(value);
                               },
                             ),
                           )),
                         ],
                       ),
                     ),
                   ),
                 ),

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
      ),
    );
  }


  Future<void> getSchoolListFunction() async{
     var schoolListAPI=SchoolListAPI();
    schoolListAPI.schoolList().then((value) async {

      if (value.statusCode == 200) {
          var schoolListResponse =SchoolListResponse.fromJson(jsonDecode(value.body));
         print('SCHOOL LIST PAGE ${schoolListResponse.data}');

         setState(() {
           schoolList =schoolListResponse.data ;
         });


        Fluttertoast.showToast(msg: schoolListResponse.message!);
        // Navigator.pushNamed(context, AppRoutes.homePage);
      } else {
        Fluttertoast.showToast(msg: jsonDecode(value.body)['message']);

      }

    });
  }

  void saveSelectedSchool(String? value) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString('School-Id', value.toString());

    setState(() {
      selectedSchool=(value)!;
    });

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

