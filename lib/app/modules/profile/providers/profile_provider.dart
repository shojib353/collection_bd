import 'dart:convert';

import 'package:bd_collection/app/modules/profile/model/profile_model.dart';
import 'package:bd_collection/utils/services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants/constants.dart';
import '../../../../utils/constants/urls.dart';

class ProfileProvider extends GetConnect {
  @override
  void onInit() {}

  final ApiService _apiService = ApiService();

  Future fetchProfileData(String url,String accessToken) {


    final response =  _apiService.fetchData(url, accessToken);

    if (response!=null){
      return response;
    }
    else{
      return response;
    }

  }



  Future<void> updateProfile(FormData formData) async {
  final url = "http://collection.bangla.gov.bd/api/profile?user-id=2";


  try {
    final response = await post(
      url,
      formData,
      headers: {
        "Authorization": "Bearer 228|64x1CTEZmsexDX6jTskc58Lh7Mw5GrH4WtGLbGR3ccbff295", // ✅ Send token
        "Content-Type": "multipart/form-data", // ✅ Correct content type for file uploads
      },
    );

  if (response.status.isOk && response.body["status"] == "success") {
  Get.snackbar("Success", response.body["message"], snackPosition: SnackPosition.BOTTOM);
  } else {
    print(response.body["message"]);
  Get.snackbar("Error", response.body["message"] ?? "Profile update failed", snackPosition: SnackPosition.BOTTOM);
  }
  } catch (e) {
  Get.snackbar("Error", "Something went wrong: $e", snackPosition: SnackPosition.BOTTOM);
  }
  }





// Future fetchData(String url, String accessToken) async {
  //   try {
  //     final response = await get(
  //       url,
  //       headers: {
  //         "Authorization": "Bearer $accessToken",
  //         "Content-Type": "application/json",
  //       },
  //     );
  //
  //     print('Requesting: $url');
  //     print('Response Status: ${response.statusCode}');
  //     print('Response Body: ${response.body}');
  //
  //     if (response.status.isOk) {
  //       return json.decode(response.body);
  //     } else {
  //       throw Exception(
  //           'Failed to fetch data. Status Code: ${response.statusCode}, Response: ${response.body}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching data: $e');
  //   }
  // }



//use getx get method









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
