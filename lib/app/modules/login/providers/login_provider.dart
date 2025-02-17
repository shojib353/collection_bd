import 'dart:convert';

import 'package:bd_collection/utils/constants/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/services/services.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
  }
  final ApiService _apiService = ApiService();



  //post login information through this

  Future sendData(String url, Map<String, dynamic> body) async {

    return _apiService.sendDataGetxPost(url, body);


  }



  // Future sendData(String url, Map<String, dynamic> body) async {
  //   final response = await http.post(Uri.parse(url), body: body);
  //   if (response.statusCode == 200) {
  //     print(json.decode(response.body));
  //
  //
  //     return json.decode(response.body);
  //   }
  //   else if(response.statusCode == 422){
  //     print(json.decode(response.body));
  //     return json.decode(response.body);
  //
  //   }
  //
  //   else {
  //
  //     throw Exception(json.decode(response.body));
  //   }
  // }

}
