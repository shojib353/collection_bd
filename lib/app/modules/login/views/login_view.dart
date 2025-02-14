import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign In",style: TextStyle(
                  fontSize: 28.0, // Adjust this value to increase/decrease font size
                  fontWeight: FontWeight.bold, // Optional: Makes the text bold
                  color: Colors.teal, // Optional: Set text color
                ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.blueGrey,
                    ),
                    children: [
                      TextSpan(
                        text: "Create now",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal, // Make it look like a link
                          decoration: TextDecoration.underline, // Underline for better visibility
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Replace with your Signup screen
                            Get.offNamed(Routes.REGISTRATION);

                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40,),

                _buildTextField('User Name', controller.email,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) return 'user name is required';
                      return null;
                    }),
                _buildTextField(
                    'Password', controller.password, obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) return 'Password is required';
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    }),

                // Obx(() {
                //   return CheckboxListTile(
                //     contentPadding: EdgeInsets.zero,
                //
                //
                //
                //     title: Text(
                //       'Remember me', // Label text
                //       style: TextStyle(fontSize: 14.0),
                //       textAlign: TextAlign.left,
                //
                //     ),
                //     value: controller.isChecked.value, // Observable value
                //     onChanged: (bool? value) {
                //       controller.toggleCheckbox(value!); // Update the state
                //     },
                //     controlAffinity: ListTileControlAffinity.leading,
                //     activeColor: Colors.teal,
                //   );
                // }),

                Obx(() {
                  return Container(
                    decoration: BoxDecoration(

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start, // Align children to the left
                      crossAxisAlignment: CrossAxisAlignment.center,


                      children: [
                        // Checkbox for "Remember me"
                        Padding(
                          padding: EdgeInsets.zero,
                          child: Checkbox(
                            value: controller.isChecked.value,
                            onChanged: (bool? value) {
                              controller.toggleCheckbox(value!); // Update the state
                            },
                            activeColor: Colors.teal,
                          ),
                        ),
                        Text(
                          'Remember me', // Label text
                          style: TextStyle(fontSize: 14.0),

                        ),
                        Spacer(), // Adds space between the checkbox and the link
                        GestureDetector(
                          onTap: () {
                            // Add your forgot password logic here
                            print('Forgot Password clicked');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.login();
                      
                          } else {
                            print("Form is invalid!");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal),
                        child: Text(
                            'login', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),





              ],
            ),
          ),


        ),
      ),

    );
  }

  Widget _buildTextField(String label,
      TextEditingController controller, {
        TextInputType keyboardType = TextInputType.text,
        bool obscureText = false,
        String? Function(String?)? validator,
        bool required = true,
      }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator ?? (value) =>
        required && value!.isEmpty
            ? '$label is required'
            : null,
        decoration: InputDecoration(
            labelText: label, border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0), // Change color when focused
      ),
            enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0), // Default border color
      ),


        ),

      ),
    );
  }
}
