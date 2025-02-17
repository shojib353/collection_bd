import 'dart:convert';

import 'package:bd_collection/utils/services/services.dart';
import 'package:get/get.dart';




class RegistrationProvider extends GetConnect {

  @override
  void onInit() {
   //httpClient.baseUrl = '${base_url}api/division-options';
  }
  
  final ApiService _apiService=ApiService();
  
  Future GetRegistrationRequireData(String url) async{
    return _apiService.fetchRegData(url);
    
    
}

  Future postSignupData(String url, Map<String, dynamic> body) async {
    return _apiService.sendDataGetxPost(url, body);
  }




}
