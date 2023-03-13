
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import 'api_helper.dart';
import 'custom_exceptions.dart';

class BusListAPI {
  dynamic result;
  Response? response;
  Map<String, dynamic>? data;


  Future<dynamic> busList() async {

    debugPrint('BUSLIST API REQUEST :');
    http.Response responseStatus;

    try {
      final response = await http.get(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.busListEndPoint),
      );
       debugPrint('BUSLIST API RESPONSE : ${response.body}}');
      responseStatus = response;
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
        result = data;
      } else if (response.statusCode == 400) {
      } else if (response.statusCode == 401) {
        //TODO
      }
    } on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return result;
  }
}
