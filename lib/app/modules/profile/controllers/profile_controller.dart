

import 'dart:io';

import 'package:bd_collection/app/modules/profile/providers/profile_provider.dart';
import 'package:bd_collection/utils/constants/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final ProfileProvider provider = Get.find<ProfileProvider>();

  final count = 0.obs;
  var userProfile = ProfileModel().obs;


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var selectedImage =" ".obs; // Store image path
  var isLoading = true.obs;
  var photo =" ".obs;




  @override
  void onInit() {

    getUserProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;




  // Future<void> saveUserData(String? token, int? userId) async {
  //   if (token != null && userId != null) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString("auth_token", token);
  //     await prefs.setInt("user_id", userId);
  //     print("Token and User ID saved successfully!");
  //   }
  // }


  Future<String?> getSavedToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("auth_token"); // ✅ Returns stored token
  }

  Future<int?> getSavedUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("user_id"); // ✅ Returns stored user ID
  }

  // Future<void> clearUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove("auth_token");
  //   await prefs.remove("user_id");
  //   print("User data cleared successfully!");
  // }
  void checkUserData() async {
    String? token = await getSavedToken();
    int? userId = await getSavedUserId();

    if (token != null && userId != null) {
      print("Stored Token: $token");
      print("Stored User ID: $userId");
    } else {
      print("No user data found.");
    }
  }



  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage.value = pickedFile.path; // Save local path
    } else {
      print("No image selected");
    }
  }













  void updateProfileData() async {
    if (selectedImage.value.isEmpty) {
      Get.snackbar("Error", "No image selected", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    File imageFile = File(selectedImage.value);

    if (!await imageFile.exists()) {
      Get.snackbar("Error", "Selected image does not exist", snackPosition: SnackPosition.BOTTOM);
      return;
    }

    Map<String, dynamic> formDataMap = {
      "name": nameController.text,
      "email": emailController.text,
      "photo": MultipartFile(imageFile, filename: selectedImage.value.split('/').last),
    };

    FormData formData = FormData(formDataMap);

    provider.updateProfile(formData);
  }

  void getUserProfile() async {

    var token = await getSavedToken(); // Retrieve saved token
    var userId = await getSavedUserId(); // Retrieve saved user ID
    String url="${base_url}api/profile?user-id=$userId";
    print("profile userid =$userId");


    // Redirect to login if no token


    if (token != null && userId != null) {
      print("profile token =$token");
       final profile = await provider.fetchProfileData(url,token);

      if (profile != null && profile != null && profile.isNotEmpty) {
        userProfile.value=ProfileModel.fromJson(profile);


        print("profile controlr call");
        Data userData = userProfile.value.data!.first;

        nameController.text=userData.name!;
        emailController.text=userData.email!;

        photo.value = userData.photo ?? '';
        isLoading.value = false;


        print("User Name: ${userData.name}");
        print("Email: ${userData.email}");
        print("Mobile: ${userData.mobile}");
        print("photo: ${userData.photo}");
      } else {
        Get.offNamed(Routes.LOGIN);

        print("Failed to fetch user profile.");
      }
    } else {
      Get.offNamed(Routes.LOGIN);
      print("No token or user ID found.");
    }
  }
  Future<void> removeTokenId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_id');
    print("Token removed successfully!");
    Get.offAllNamed(Routes.LOGIN);
  }

  void logout() {
    removeTokenId();


  }








}
