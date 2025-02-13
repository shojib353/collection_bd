import 'dart:io';

import 'package:bd_collection/utils/constants/constants.dart';
import 'package:bd_collection/utils/services/services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var isTokenValid = validateToken();
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute:
      await isTokenValid ? AppPages.VERIFIEDINITIAL : AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<bool> validateToken() async {
  final SharedPreferences _prefs = await SharedPreferences.getInstance();
  final userId = _prefs.getInt('user_id');
  var userToken = _prefs.getString('auth_token');

  if (userId != null && userToken != null) {
    final ApiService _apiService = ApiService();
    final response = await _apiService.fetchDataWithToken(
        '${Constants.PROFILE_API_URL}$userId', userToken);
    if (response != null) {
      if (response['status'] == 'success') {
        return true;
      }
    }
  }
  return false;
}
