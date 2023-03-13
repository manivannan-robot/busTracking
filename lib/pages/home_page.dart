// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:async';

import 'package:azep_bus_app/routes/app_routes.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Stack(
            children: [
              GoogleMap(
                padding:EdgeInsets.only(top: 80.0,),
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(target: LatLng(10.975441058345867, 76.96307198169293),zoom: 17),
                onMapCreated: (GoogleMapController controller){
                  setState(() {
                    mapController=controller;
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

            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Color(0xFF4885ED),
          height: 93.68,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    child: Text(
                      'Start Tracking',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    onPressed: isTracking
                        ? null
                        : () async {
                            await BackgroundLocationTrackerManager
                                .startTracking();
                            setState(() => isTracking = true);
                          },
                  ),
                  Container(
                    width: 2,
                    color: Colors.blue.shade900,
                  ),
                  MaterialButton(
                    child: Text(
                      'Stop Tracking',
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    onPressed: isTracking
                        ? () async {
                            await LocationDao().clear();
                            await _getLocations();
                            await BackgroundLocationTrackerManager
                                .stopTracking();
                            setState(() => isTracking = false);

                            Navigator.pushNamed(context, AppRoutes.busListPage);
                           
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
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
    database
        .child('school/islamiyah/trips')
        .set({'driverId': driverId, 'location': locations});
    setState(() {
      _locations = locations;
    });
  }

  void _startLocationsUpdatesStream() {
    _timer?.cancel();
    _timer = Timer.periodic(
        const Duration(milliseconds: 250), (timer){
          _getLocations();
          _getStreaming();
        });
  }

  void _getStreaming() async{
    final locations = await LocationDao().getLocations();
    debugPrint("MANI HOMEPAGE ${locations}");


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
