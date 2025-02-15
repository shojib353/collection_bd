import 'dart:convert';

import 'package:bd_collection/app/modules/profile/model/profile_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/urls.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {}

  Future fetchData(String url, String accessToken) async {
    try {
      final response = await get(
        url,
        headers: {
          "Authorization": "Bearer $accessToken",
          "Content-Type": "application/json",
        },
      );

      print('Requesting: $url');
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.status.isOk) {
        return json.decode(response.body);
      } else {
        throw Exception(
            'Failed to fetch data. Status Code: ${response.statusCode}, Response: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }








  // Future fetchData(String url,String accessToken) async {
  //   //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
  //   try {
  //     final response = await http.get(Uri.parse(url),
  //       headers: {
  //         "Authorization": "Bearer $accessToken", // ✅ Send token in headers
  //         "Content-Type": "application/json",
  //       },);
  //
  //     //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
  //     if (response.statusCode == 200) {
  //
  //       return json.decode(response.body);
  //     } else {
  //
  //       throw Exception('Failed to fetch posts');
  //     }
  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   }
  // }








  // Future fetchUserProfile(String accessToken, int userId) async {
  //   String apiUrl = "https://collection.bangla.gov.bd/api/profile?user-id=$userId";
  //
  //   try {
  //     final response = await http.get(
  //       Uri.parse(apiUrl),
  //       headers: {
  //         "Authorization": "Bearer $accessToken", // ✅ Send token in headers
  //         "Content-Type": "application/json",
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final jsonResponse = jsonDecode(response.body);
  //       return ProfileModel.fromJson(jsonResponse);
  //     } else {
  //       print("Failed to fetch profile: ${response.body}");
  //       return null;
  //     }
  //   } catch (e) {
  //     print("Error fetching profile: $e");
  //     return null;
  //   }
  // }




}
