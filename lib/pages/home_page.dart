// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:async';
import 'dart:html';

import 'package:azep_bus_app/pages/wigdets/nav_bar.dart';
import 'package:background_location_tracker/background_location_tracker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import '../location/location_repo.dart';

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
    driverId = ModalRoute.of(context)?.settings.arguments as String?;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            //GoogleMap
            GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              initialCameraPosition:
                  CameraPosition(target: LatLng(0, 0), zoom: 17),
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  mapController = controller;
                });
                _getStreaming();
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
            Column(
              children: [
                SizedBox(
                  height: size.height * 0.65,
                ),
                Center(
                  child: ElevatedButton(onPressed: () {}, child: Text('Stata')),
                ),
              ],
            ),
          ],
        ),

        //BottomNavigationBar
        bottomNavigationBar: NavBar(),

        // bottomNavigationBar: Container(
        //   color: Color(0xFF4885ED),
        //   height: 93.68,
        //   child: Center(
        //     child: Padding(
        //       padding: const EdgeInsets.only(left: 25.0, right: 25),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           //Home Button
        //           IconButton(
        //             onPressed: () {},
        //             icon: Icon(
        //               Icons.home_filled,
        //               size: 35,
        //               color: Color(0xFFF8F8F8),
        //             ),
        //           ),
        //           SizedBox(
        //             width: 65,
        //           ),

        //           //Settings Button
        //           IconButton(
        //             onPressed: () {
        //               // Navigator.pushNamed(context, AppRoutes.settingsPage);
        //             },
        //             icon: Icon(
        //               Icons.settings,
        //               size: 35,
        //               color: Color(0xFFF8F8F8),
        //             ),
        //           ),

        //           // MaterialButton(
        //           //   child: Text(
        //           //     'Start Tracking',
        //           //     style: GoogleFonts.inter(
        //           //         fontSize: 18, fontWeight: FontWeight.w500),
        //           //   ),
        //           //   onPressed: isTracking
        //           //       ? null
        //           //       : () async {
        //           //           await BackgroundLocationTrackerManager
        //           //               .startTracking();
        //           //           setState(() => isTracking = true);
        //           //         },
        //           // ),
        //           // Container(
        //           //   width: 2,
        //           //   color: Colors.blue.shade900,
        //           // ),
        //           // MaterialButton(
        //           //   child: Text(
        //           //     'Stop Tracking',
        //           //     style: GoogleFonts.inter(
        //           //         fontSize: 18, fontWeight: FontWeight.w500),
        //           //   ),
        //           //   onPressed: isTracking
        //           //       ? () async {
        //           //           await LocationDao().clear();
        //           //           await _getLocations();
        //           //           await BackgroundLocationTrackerManager
        //           //               .stopTracking();
        //           //           setState(() => isTracking = false);

        //           //           Navigator.pushNamed(context, AppRoutes.busListPage);
        //           //         }
        //           //       : null,
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
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
    //final currentLocation = LocationDao().getLocations();
    database
        .child('school/islamiyah/trips')
        .set({'driverId': driverId, 'location': locations});
    setState(() {
      _locations = locations;
    });
    //debugPrint("Current Location${currentLocation}");
  }

  void _startLocationsUpdatesStream() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      _getLocations();
      _getStreaming();
    });
  }

  void _getStreaming() async {
    var location = await LocationDao1().getLocationsData();

    //debugPrint("MANI HOMEPAGE ${location}");
    // mapController?.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(data.lat, data.lon), zoom: 17)));

    //debugPrint("My Tracker${location}");

    // BackgroundLocationTrackerManager.handleBackgroundUpdated((data) async {
    //   debugPrint("MANI HOMEPAGE ${data.lat}");
    //   mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(data.lat ,data.lon),zoom: 17)));
    // });
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
