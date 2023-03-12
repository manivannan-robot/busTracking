
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import 'api_helper.dart';
import 'custom_exceptions.dart';

class BusListAPI {
  BusListAPI({required this.context});

  final BuildContext context;
  Future<dynamic> busList() async {

    debugPrint('BUSLIST API REQUEST :');
    http.Response responseStatus;

    try {
      final response = await http.get(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.busListEndPoint),
      );
       debugPrint('LOGIN API RESPONSE : $response}');
      responseStatus = response;
    } on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return responseStatus;
  }
}
