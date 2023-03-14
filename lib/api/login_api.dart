
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/login_model.dart';
import 'api_helper.dart';
import 'custom_exceptions.dart';

class LoginAPI {
  LoginAPI({required this.context});

  final BuildContext context;
  Future<dynamic> login(LoginRequestBody requestBody) async {

    debugPrint('LOGIN API REQUEST : ${requestBody.toJson()}');
    http.Response responseStatus;

    try {
      final response = await http.post(
        Uri.parse(ApiBaseUrl.baseUrl + ApiEndPoint.loginEndPoint),
        body: json.encode(requestBody.toJson()),
      );
      debugPrint('LOGIN API RESPONSE : ${requestBody.toJson()}');
      responseStatus = response;
    } on SocketException {
         Fluttertoast.showToast(msg:"No Internet connection. Please Try Again Later!");
      throw FetchDataException('No Internet connection');
    }
    return responseStatus;
  }
}
