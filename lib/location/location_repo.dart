
import 'dart:math';

import 'package:background_location_tracker/background_location_tracker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repo {
  static Repo? _instance;

  Repo._();

  factory Repo() => _instance ??= Repo._();

  Future<void> update(BackgroundLocationUpdateData data) async {
    final text = 'Location Update: Lat: ${data.lat} Lon: ${data.lon}';
    print('MANI update $text'); // ignore: avoid_print
    sendNotification(text);
    await LocationDao().saveLocation(data);
    await LocationDao1().saveLocationData(data);
  }
}

class LocationDao {
  static const _locationsKey = 'background_updated_locations';
  static const _locationSeparator = '-/-/-/';

  static LocationDao? _instance;

  LocationDao._();

  factory LocationDao() => _instance ??= LocationDao._();

  SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async =>
      _prefs ??= await SharedPreferences.getInstance();


  Future<void> saveLocation(BackgroundLocationUpdateData data) async {
    final locations = await getLocations();

    locations.add('${data.lat},${data.lon}');


    await (await prefs)
        .setString(_locationsKey, locations.join(_locationSeparator));
  }

  Future<List<String>> getLocations() async {
    final prefs = await this.prefs;
    await prefs.reload();
    final locationsString = prefs.getString(_locationsKey);
    if (locationsString == null) return [];
    return locationsString.split(_locationSeparator);
  }

  Future<void> clear() async => (await prefs).remove(_locationsKey);
}


class LocationDao1 {
  static const _locationsKey1 = 'background_updated';
  // static const _locationSeparator = '-/-/-/';

  static LocationDao1? _instance;

  LocationDao1._();

  factory LocationDao1() => _instance ??= LocationDao1._();

  SharedPreferences? _prefs1;

  Future<SharedPreferences> get prefs1 async =>
      _prefs1 ??= await SharedPreferences.getInstance();


  Future<void> saveLocationData(BackgroundLocationUpdateData data) async {
    var locations = await getLocationsData();

    String loc='${data.lat},${data.lon}';
   debugPrint("MANI loc ${locations}locations");


    await (await prefs1)
        .setString(_locationsKey1,loc.toString() );
  }

  Future<String> getLocationsData() async {
    final prefs1 = await this.prefs1;
    await prefs1.reload();
    final locationsString = prefs1.getString(_locationsKey1);
    if (locationsString == null) return 'empty';
    return locationsString;
  }

  Future<void> clear() async => (await prefs1).remove(_locationsKey1);
}




void sendNotification(String text) {
  const settings = InitializationSettings(
    android: AndroidInitializationSettings('app_icon'),
    iOS: IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    ),
  );
  FlutterLocalNotificationsPlugin().initialize(
    settings,
    onSelectNotification: (data) async {
      print('ON CLICK $data'); // ignore: avoid_print
    },
  );
  FlutterLocalNotificationsPlugin().show(
    Random().nextInt(9999),
    'Title',
    text,
    const NotificationDetails(
      android: AndroidNotificationDetails('test_notification', 'Test','Description'),
      iOS: IOSNotificationDetails(),
    ),
  );
}