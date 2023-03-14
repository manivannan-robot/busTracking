// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:azep_bus_app/pages/wigdets/nav_bar.dart';
import 'package:background_location_tracker/background_location_tracker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../location/location_repo.dart';
import '../models/trip_starting_arguments.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isTracking = false;

  Timer? _timer;
  List<String> _locations = [];
  String? driverId;
  final database = FirebaseDatabase.instance.ref();
  GoogleMapController? mapController;
  final currentLocation = LocationDao().getLocations();
  var busId ;
  var schoolId ;
  var userId ;


  @override
  void initState() {
    super.initState();
    _getTrackingStatus();
    _startLocationsUpdatesStream();
    _requestLocationPermission();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TripStartArguments arguments = ModalRoute.of(context)?.settings.arguments as TripStartArguments;

     busId = arguments.busId;
     schoolId  = arguments.schoolId;
    userId = arguments.userId;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //GoogleMap
            GoogleMap(
              padding: EdgeInsets.only(top: 100),
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(0, 0), zoom: 17),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });

              },
            ),

            //custom AppBar
            Container(
              height: 105.68,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF4885ED),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  'ISLAMIYAH SCHOOL',
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),


                 Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      SizedBox(
                        height: size.height * 0.735,
                      ),
                      Visibility(
                        visible: !isTracking,
                        child: SizedBox(
                          width:200,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                            onPressed: ()async {
                              await BackgroundLocationTrackerManager.startTracking();
                              setState(() => isTracking = true);
                            },
                            child: Text('Start Trip',style: TextStyle(fontSize: 25)),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isTracking,
                        child: SizedBox(
                          width: 200,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                            onPressed: () async{
                              await LocationDao().clear();
                              await _getLocations();
                              await BackgroundLocationTrackerManager.stopTracking();
                              setState(() => isTracking = false);
                            },
                            child: Text('Stop Trip',style: TextStyle(fontSize: 25),),
                          ),
                        ),
                      ),
                    ],
                  ),
              ),


          ],
        ),

        //BottomNavigationBar
        bottomNavigationBar: NavBar(),
      ),
    );
  }

  Future<void> _getTrackingStatus() async {
    isTracking = await BackgroundLocationTrackerManager.isTracking();
    setState(() {});
  }

  Future<void> _requestLocationPermission() async {
    final result = await Permission.locationAlways.request();
    if (result == PermissionStatus.granted) {
      print('GRANTED'); // ignore: avoid_print
    } else {
      print('NOT GRANTED'); // ignore: avoid_print
    }
  }

  Future<void> _getLocations() async {
    final locations = await LocationDao().getLocations();

    if(locations.isNotEmpty) {
      database.child('school/islamiyah/trips/$busId').set({
        'user-Id': userId,
        'schoolId': schoolId,
        'busId': busId,
        'location': locations
      });
    }
    // debugPrint("Current Location${locations}");

  }

  void _startLocationsUpdatesStream() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 5000), (timer) {
      _getLocations();
      _getMapAnimation();
    });
  }


  void _getMapAnimation() async{
    final locations = await LocationDao1().getLocationsData();
    debugPrint("MANI HOMEPAGE ${locations}");
    String latLngString = locations;
    List<String> latLngList = latLngString.split(',');
    double lat = double.parse(latLngList[0]);
    double lng = double.parse(latLngList[1]);
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat,lng),zoom: 17)));

  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
