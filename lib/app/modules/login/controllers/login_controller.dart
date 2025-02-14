import 'dart:convert';

import 'package:bd_collection/app/modules/login/model/sign_in.dart';
import 'package:bd_collection/app/modules/login/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final LoginProvider provider = Get.find<LoginProvider>();
  //TODO: Implement LoginController

  final count = 0.obs;
  final RxString _token = ''.obs;
  var isChecked = false.obs;
  var isToken = false.obs;
  
  
  
  //email and password come from input field
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();



  void next(){
    Get.offNamed(Routes.PROFILE);

  }
  
  @override
  void onInit() {
    super.onInit();
    loadCredentials();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }

  // Load saved email and password from SharedPreferences
  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

    if (savedEmail != null && savedPassword != null) {
      email.text = savedEmail;
      password.text = savedPassword;
      isChecked.value = true;  // Set the "Remember me" checkbox to checked
    }
  }

  
  
  
  
  //sharedpre

  // Future<void> saveToken(String? token) async {
  //   if (token != null) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('auth_token', token);
  //     print("Token saved successfully!");
  //   }
  // }





  Future<void> saveToken(String? token, int? userId) async {
    if (token != null && userId != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("auth_token", token);
      await prefs.setInt("user_id", userId);
      print("Token and User ID saved successfully!");
    }
  }




  Future<void> fetchToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token.value = prefs.getString('auth_token') ?? '';
    print("fetch token done successfully: ${_token.value}");


  }


  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    print("Token removed successfully!");
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      String apiUrl = "https://collection.bangla.gov.bd/api/login"; // ✅ Use login API

      Map<String, dynamic> userMap = {
        "username": email.text,
        "password": password.text,
      };
      if (isChecked.value) {
        // Save email and password to SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email.text);
        await prefs.setString('password', password.text);
      } else {
        // If "Remember me" is unchecked, remove credentials from SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('email');
        await prefs.remove('password');
      }

      try {
        final response = await provider.sendData(apiUrl, userMap);

        if (response != null) {
          SignIn loginResponse = SignIn.fromJson(response); // ✅ Assuming SignUp model works for login

          if (loginResponse.status == "success" && loginResponse.data != null) {
            String? token = loginResponse.accessToken;
            int? userId = loginResponse.data?.user?.id?.toInt();
            print("Login Successful!");
            print("Token: $token");
            print("user_id: $userId");

            await saveToken(token,userId);
            isToken.value=true;
            // ✅ Save token for authentication

            // ✅ Print user details if needed
            print(jsonEncode(loginResponse.data?.user?.toJson()));
            next();
          }
          else if (loginResponse.status == "error" && loginResponse.data != null) {
            print("Login Failed: ${loginResponse.message}");

            // ✅ Handle validation errors
            Map<String, dynamic> errorData = loginResponse.data!.toJson();
            errorData.forEach((key, value) {
              if (value is List && value.isNotEmpty) {
                print("$key: ${value[0]}"); // Print the first validation error message
              }
            });
          }
          else {
            print("Login Failed: ${loginResponse.message}");
          }
        }
      } catch (e) {
        print("Error during login: $e");
      }
    }
  }

  
  


}
