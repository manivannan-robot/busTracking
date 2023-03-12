// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:azep_bus_app/api/bus_list_api.dart';
import 'package:azep_bus_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bus_list_model.dart';

class BusLists extends StatefulWidget {

  @override
  State<BusLists> createState() => _BusListsState();
}

class _BusListsState extends State<BusLists> {

 BusListResponse?  busListResponse;
  @override
  void initState() {
    super.initState();
    getBusListFunction();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body:

            //Custom AppBar
            Column(
          children: [
            Container(
              height: 100,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                color: Color(0xFF4885ED),
              ),

              //School Name
              child: Center(
                child: Text(
                  'ISLAMIYA SCHOOL',
                  style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 13.93,
            ),

            //PlaceHolder Cards

            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: GestureDetector(
                child: Container(
                  height: 48.68,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.homePage,arguments: '9840119746');
                },
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(

              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11.0, left: 11.0),
              child: Container(
                height: 48.68,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 12,
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
              //Home Button
              IconButton(
                onPressed: () {

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

              //Settings Button
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.settingsPage);

                },
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


  void getBusListFunction() {
    var busListAPI=BusListAPI(context: context);
    busListAPI.busList().then((value) async {

    if (value.statusCode == 200) {
      busListResponse = BusListResponse.fromJson(jsonDecode(value.body));

    Fluttertoast.showToast(msg: busListResponse!.message!);
   // Navigator.pushReplacementNamed(context, AppRoutes.homePage);
    } else {
    Fluttertoast.showToast(msg: jsonDecode(value.body)['message']);

    }

     });
  }


}


