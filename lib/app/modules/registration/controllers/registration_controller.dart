import 'dart:convert';

import 'package:bd_collection/app/modules/registration/model/sign_up.dart';
import 'package:bd_collection/app/modules/registration/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/urls.dart';
import '../model/divition.dart';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {



  //TODO: Implement RegistrationController
  Future fetchData(String url) async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    try {
      final response = await http.get(Uri.parse('${base_url}$url'));

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
    if (response.statusCode == 201) {


      return json.decode(response.body);
    }
    else if(response.statusCode == 422){
      return json.decode(response.body);

    }

    else {

      throw Exception(json.decode(response.body));
    }
  }

  final TextEditingController name = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController referralCode = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final RxString division = ''.obs;
  final RxString district = ''.obs;
  final RxString upazila = ''.obs;
  final RxString dialect = ''.obs;

  final RxString division_id = ''.obs;
  final RxString district_id = ''.obs;
  final RxString upazila_id = ''.obs;
  final RxString dialect_id = ''.obs;


  late var div = Division().obs;
  late var dis = Division().obs;
  late var upodis = Division().obs;
  late var dial = Division().obs;
  var isloading=true.obs;
  var isdisloading=true.obs;
  var isupodisloading=true.obs;
  var isdialloading=true.obs;












void load() async{
  final data= await fetchData("api/division-options");
  div.value=Division.fromJson(data);
  isloading.value=false;
  print(div.value.data?[1].value);
}

  void load_dis(int division) async{
    final data= await fetchData("api/district-options/$division");
    dis.value=Division.fromJson(data);
    isdisloading.value=false;
    print(dis.value.data?[1].value);
  }


  void load_upodis(int upazilas) async{
    final data= await fetchData("api/upazila-options/$upazilas");

    upodis.value=Division.fromJson(data);
    isupodisloading.value=false;
    print("load_upodis");


  }


  void load_dial(int d) async{
    final data= await fetchData("api/dialect-options/$d");

    dial.value=Division.fromJson(data);
    isdialloading.value=false;
    print("load_dial");


  }


  @override
  void onInit(){
    super.onInit();
    load();


    



  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

  }




























  Future<void> sign_Up() async {
    if (formKey.currentState!.validate()) {
      String apiUrl = "https://collection.bangla.gov.bd/api/register";

      // ✅ Validate mobile number before sending request
      if (!RegExp(r'^\d{11}$').hasMatch(mobile.text)) {
        print("Invalid Mobile Number! It must be 11 digits.");
        return;
      }

      Map<String, dynamic> userMap = {
        "name": name.text,
        "email": email.text,
        "mobile": mobile.text,
        "password": password.text,
        "password_confirmation": confirmPassword.text,
        "division": division_id.value,
        "district": district_id.value,
        "upazila": upazila_id.value,
        "dialect": dialect_id.value,
        "referer_code": referralCode.text,
      };

      try {
        final response = await sendData(apiUrl, userMap);
        if (response != null) {
          SignUp signUpResponse = SignUp.fromJson(response);

          if (signUpResponse.status == "success" && signUpResponse.data != null) {
            String? token = signUpResponse.data!.token;
            print("Signup Successful!");
            print("Token: $token");

            print(jsonEncode(signUpResponse.data?.user?.toJson()));

            await saveToken(token);
          }
          else if (signUpResponse.status == "error" && signUpResponse.data != null) {
            String? errorMessage = signUpResponse.message;
            print("Error Message: $errorMessage");

            // Convert `signUpResponse.data` to a Map
            Map<String, dynamic> errorData = signUpResponse.data!.toJson();

            // Access validation messages dynamically
            errorData.forEach((key, value) {
              if (value is List && value.isNotEmpty) {
                print("$key: ${value[0]}");  // Print the first validation error message
              }
            });
          }


          else {
            print("Signup Failed: ${signUpResponse.message}");

            // ✅ Handle API validation errors
            if (signUpResponse.data != null) {
              print("Validation Errors: ${signUpResponse.data}");
            }
          }
        }
      } catch (e) {
        print("Error during signup: $e");

      }
    }
  }




  Future<void> saveToken(String? token) async {
    if (token != null) {


      print("Token saved successfully!");
    }
  }








}
