// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:azep_bus_app/api/bus_list_api.dart';
import 'package:azep_bus_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bus_list_model.dart';
import '../models/trip_starting_arguments.dart';
import '../utils/constants.dart';
import '../utils/size.dart';

class BusLists extends StatefulWidget {
  @override
  State<BusLists> createState() => _BusListsState();
}

class _BusListsState extends State<BusLists> {
    var busListAPI=BusListAPI();
    var userId;
    var schoolId;

  @override
  void initState() {
    super.initState();
    getArguments();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body://Custom App Bar
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
            Expanded(
              child: FutureBuilder(
                future: busListAPI.busList(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData &&
                      snapshot.connectionState ==
                          ConnectionState.waiting) {
                    return  Transform.scale(scale: 0.5, child: CircularProgressIndicator(strokeWidth: 2,));
                  } else {
                    print('BUS LIST future builder ${snapshot.data}');
                    var res = BusListResponse.fromJson(snapshot.data);
                    return RefreshIndicator(
                      backgroundColor: ColorConstant.bgColor,
                      displacement: 10,
                      onRefresh: () {
                        return Future.delayed(
                            const Duration(seconds: 1), () {
                          setState(() {});
                        });
                      },
                      child: res.data!.isEmpty
                          ? const Text("No Buses available.!",) :
                      ListView.builder(
                        shrinkWrap: true,
                        physics:
                        const AlwaysScrollableScrollPhysics(),
                        padding: getPadding(bottom: 20),
                        itemCount: res.data!.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: getPadding(all: 15),
                            margin: getMargin(
                                left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: ColorConstant.bgColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacementNamed(context, AppRoutes.homePage,arguments:TripStartArguments(busId:'${res.data![i]!.busId}',userId: userId,schoolId:schoolId));
                              },
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          res.data![i]!.busName!,
                                          style: TextStyle(
                                            overflow: TextOverflow
                                                .ellipsis,
                                            color: ColorConstant
                                                .textBlack,
                                            fontSize:
                                            getFontSize(21),
                                            fontFamily:
                                            'IBM Plex Sans',
                                            fontWeight:
                                            FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          res.data![i]!.busNo!,
                                          style: TextStyle(
                                            overflow: TextOverflow
                                                .ellipsis,
                                            color: ColorConstant
                                                .textBlack,
                                            fontSize:
                                            getFontSize(21),
                                            fontFamily:
                                            'IBM Plex Sans',
                                            fontWeight:
                                            FontWeight.w700,
                                          ),
                                        ),
                                      ),


                                    ],
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
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
                  Navigator.pushReplacementNamed(context, AppRoutes.busListPage);

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
                  Navigator.pushReplacementNamed(context, AppRoutes.settingsPage);

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

  List<BusListResponseData?>?  busListResponseData;

  void getBusListFunction() {

    busListAPI.busList().then((value) async {

    if (value.statusCode == 200) {
      var busListResponse = BusListResponse.fromJson(jsonDecode(value.body));
      setState(() {
        busListResponseData= busListResponse?.data;
      });

    Fluttertoast.showToast(msg: busListResponse!.message!);
   // Navigator.pushReplacementNamed(context, AppRoutes.homePage);
    } else {
    Fluttertoast.showToast(msg: jsonDecode(value.body)['message']);

    }

     });
  }

  void getArguments() async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    userId= pref.getString('User-Id');
    schoolId=pref.getString('School-Id');
    
  }


}


