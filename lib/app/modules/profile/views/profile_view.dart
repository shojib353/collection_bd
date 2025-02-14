import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Information")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: controller.nameController),

            SizedBox(height: 5),
            Expanded(child:
            Text("Photo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    controller.pickImage();
                  },
                  child: Text("Choose File"),
                ),
                SizedBox(height: 10),
                controller.selectedImage.value!.isNotEmpty // ✅ Check if image URL is available
                    ?Expanded(child:  Text(controller.selectedImage.value.toString(),) )// ✅ Use Image.network()
                    : Text("No file chosen"),
              ],
            )
           ,
            SizedBox(height: 5),
            Text("Email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            TextField(controller: controller.emailController, enabled: false),
            SizedBox(height: 20),
            // Obx(() => ElevatedButton(
            //   onPressed: controller.isLoading.value ? null : controller.updateProfile,
            //   child: controller.isLoading.value
            //       ? CircularProgressIndicator()
            //       : Text("Save"),
            // )),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () =>controller.logout(),



                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal),
                    child: Text(
                        'sign out', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
