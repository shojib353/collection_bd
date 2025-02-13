import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future fetchData(String url) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    try {
      final response = await http.get(Uri.parse(url));

      //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch posts');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future fetchDataWithToken(String url, String token) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to fetch posts');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future sendData(String url, Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(url), body: body);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}