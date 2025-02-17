import 'package:get/get.dart';

import '../../../../utils/services/services.dart';

class AllRecordProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }
  final ApiService _apiService = ApiService();
  
  Future getAllrecord(String url,String accessToken) async{
    
    final respose=await _apiService.fetchData(url, accessToken);

    print(respose==null);
    return respose;
    
  }

}
