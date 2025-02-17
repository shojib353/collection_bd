import 'dart:convert';


import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect{



  Future fetchData(String url,String accessToken) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE

    print(url);
    try {
      final response = await get(url,
        headers: {
          "Authorization": "Bearer $accessToken", // ✅ Send token in headers
          "Content-Type": "application/json",
        },);

      //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
      if (response.isOk) {
        print(json.decode(response.bodyString!));
        return json.decode(response.bodyString!);

      } else {

        throw Exception('Failed to fetch posts');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }





  Future sendDataGetxPost(String url, Map<String, dynamic> body) async {
    try {
      final response = await post(url, body);


      if (response.isOk || response.statusCode == 422) {
        return json.decode(response.bodyString!);
      } else {
        throw Exception('Error: ${response.statusCode}, ${response.bodyString}');
      }
    } catch (e) {
      print('Exception: $e');
      return {'error': 'Something went wrong', 'details': e.toString()};
    }
  }



  Future fetchRegData(String url) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE

    print(url);
    try {
      final response = await get(url);

      //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
      if (response.isOk) {

        return json.decode(response.bodyString!);
      } else {

        throw Exception('Failed to fetch posts');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }





}