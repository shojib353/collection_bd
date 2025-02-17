import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          ElevatedButton(
            onPressed: () => controller.logout(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: Text('Sign Out', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // New Card with "My Record" and "All Records" buttons
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Add your logic for "My Record"
                        },
                        child: Text("My Record"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Get.toNamed(Routes.ALL_RECORD);
                        },
                        child: Text("All Records"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Existing Card with Profile Information
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      TextField(controller: controller.nameController),

                      SizedBox(height: 10),
                      Text("Photo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              controller.pickImage();
                            },
                            child: Text("Choose File"),
                          ),
                          SizedBox(width: 10),
                          Obx(() => controller.selectedImage.value.isNotEmpty
                              ? Expanded(child: Text(controller.selectedImage.value))
                              : Text("No file chosen")),
                        ],
                      ),
                      SizedBox(height: 10),
                      Obx(() => controller.photo.value.isNotEmpty
                          ? Text(controller.photo.value)
                          : Text("No file chosen")),
                      SizedBox(height: 10),
                      Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      TextField(controller: controller.emailController, enabled: true),

                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () => controller.updateProfileData(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          child: Text('Save', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
