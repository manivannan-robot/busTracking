
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

class SchoolListAPI {


  Future<dynamic> schoolList() async {

    debugPrint('SCHOOL LIST API REQUEST :');
    http.Response responseStatus;

    try {
      final response = await http.get(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.schoolListEndPoint),
      );
      responseStatus = response;

      debugPrint('SCHOOL LIST RESPONSE : ${responseStatus.body}}');
    } on SocketException {
      Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return responseStatus;
  }
}
