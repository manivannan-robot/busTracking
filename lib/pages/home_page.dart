import 'dart:async';

import 'package:background_location_tracker/background_location_tracker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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

  List<String> busses = ['bus1','bus2','bus3'];
  String? driverId;
  final database=FirebaseDatabase.instance.ref();


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
    driverId= ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracking'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [

                  MaterialButton(
                    child: const Text('Start Tracking'),
                    onPressed: isTracking
                        ? null
                        : () async {
                      await BackgroundLocationTrackerManager.startTracking();
                      setState(() => isTracking = true);

                    },
                  ),
                  MaterialButton(
                    child: const Text('Stop Tracking'),
                    onPressed: isTracking
                        ? () async {
                      await LocationDao().clear();
                      await _getLocations();
                      await BackgroundLocationTrackerManager
                          .stopTracking();
                      setState(() => isTracking = false);
                    }
                        : null,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.black12,
              height: 2,
            ),
            const Text('Locations'),
            MaterialButton(
              child: const Text('Refresh locations'),
              onPressed: _getLocations,
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  if (_locations.isEmpty) {
                    return const Text('No locations saved');
                  }
                  return ListView.builder(
                    itemCount: _locations.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        _locations[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
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
    database.child('school/islamiyah/trips').set({'driverId':driverId,'location':locations});
    setState(() {
      _locations = locations;
    });
  }

  void _startLocationsUpdatesStream() {
    _timer?.cancel();
    _timer = Timer.periodic(
        const Duration(milliseconds: 2500), (timer) => _getLocations());
  }
}
