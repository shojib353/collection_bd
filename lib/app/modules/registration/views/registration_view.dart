
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';
import '../model/divition.dart';
import '../widgets/custom_dropdown.dart';


class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
          
          
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text("Sign Up",style: TextStyle(
                        fontSize: 28.0, // Adjust this value to increase/decrease font size
                        fontWeight: FontWeight.bold, // Optional: Makes the text bold
                        color: Colors.teal, // Optional: Set text color
                      ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10,),
          
                      _buildTextField(
                          'Name', controller.name, validator: (value) {
                        if (value!.isEmpty) return 'Name is required';
                        return null;
                      }),
                      _buildTextField('Mobile', controller.mobile,
                          keyboardType: TextInputType.phone, validator: (value) {
                            if (value!.isEmpty)
                              return 'Mobile number is required';
                            if (!RegExp(r'^\d{10,}$').hasMatch(value))
                              return 'Enter a valid mobile number';
                            return null;
                          }),
                      _buildTextField('Email', controller.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) return 'Email is required';
                            if (!GetUtils.isEmail(value))
                              return 'Enter a valid email';
                            return null;
                          }),
                      _buildTextField(
                          'Password', controller.password, obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) return 'Password is required';
                            if (value.length < 6)
                              return 'Password must be at least 6 characters';
                            return null;
                          }),
                      _buildTextField(
                          'Confirm Password', controller.confirmPassword,
                          obscureText: true, validator: (value) {
                        if (value!.isEmpty) return 'Please confirm your password';
                        if (value != controller.password.text)
                          return 'Passwords do not match';
                        return null;
                      }),
                      SizedBox(height: 10),
          
          
                      Row(
                        children: [
                          Expanded(
          
                            // Division start
          
          
                            child:
                            Obx(() {
                              if (controller.isloading.value) {
                                return CustomDropdown(
                                  label: "Division",
                                  items: controller.div.value.data,
                                  // Pass your list of items
                                  value: controller.division.value,
                                  // Selected value
                                  onChanged: ((newValue) =>
                                      controller.afterOnchangeDropdownForDivision(
                                          newValue)),
                                ); // ✅ Show loader while data is loading
                              }
                              return CustomDropdown(
                                label: "Division",
                                items: controller.div.value.data,
                                // Pass your list of items
                                value: controller.division.value,
                                // Selected value
                                onChanged: ((newValue) =>
                                    controller.afterOnchangeDropdownForDivision(
                                        newValue)),
                              );
          
                              // return _buildDropdown(
                              //   'Division',
                              //
                              //   controller.div.value.data ?? [],
                              // );
                            }),
                          ),
          
          
                          // Division end
          
          
                          SizedBox(width: 10),
          
                          //  District start
                          Expanded(
                            child: Obx(() {
                              if (controller.isdisloading.value) {
                                return CustomDropdown(
                                  label: "District",
                                  items: [],
                                  // Pass your list of items
                                  value: controller.district.value,
                                  // Selected value
                                  onChanged: ((newValue) =>
                                      controller.afterOnchangeDropdownForDistrict(
                                          newValue)),
                                );
                                // return _disbuildDropdown(
                                //   'Distict',
                                //
                                //   [],
                                // ); // ✅ Show loader while data is loading
                              }
                              return CustomDropdown(
                                label: "District",
                                items: controller.dis.value.data,
                                // Pass your list of items
                                value: controller.district.value,
                                // Selected value
                                onChanged: ((newValue) =>
                                    controller.afterOnchangeDropdownForDistrict(
                                        newValue)),
                              );
                              // return _disbuildDropdown(
                              //   'Distict',
                              //
                              //   controller.dis.value.data ?? [],
                              // );
                            }),
                          ),
                        ],
                      ),
          
                      //  District End
          
          
                      SizedBox(height: 10),
          
          
                      Obx(() =>
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
          
                            children: [
          
                              //'Upazila/Thana' start
          
                              Expanded(
          
                                  child:
                                  controller.isupodisloading.value ?
                                  CustomDropdown(
                                    label: 'Upazila/Thana',
                                    items: [],
                                    // Pass your list of items
                                    value: controller.upazila.value,
                                    // Selected value
                                    onChanged: ((newValue) =>
                                        controller
                                            .afterOnchangeDropdownForUpozila(
                                            newValue)),
                                  )
                                  // _upazilabuildDropdown(
                                  //   'Upazila/Thana',
                                  //
                                  //   [],
                                  // ) :
                                      :
                                  CustomDropdown(
                                    label: "Upazila/Thana",
                                    items: controller.upodis.value.data,
                                    // Pass your list of items
                                    value: controller.upazila.value,
                                    // Selected value
                                    onChanged: ((newValue) =>
                                        controller
                                            .afterOnchangeDropdownForUpozila(
                                            newValue)),
                                  )
          
          
                              ),
          
          
                              //'Upazila/Thana' end
          
          
                              SizedBox(width: 10),
          
          
                              // dialeal start
          
                              Expanded(
          
                                  child: Obx(() =>
                                  controller.isdialloading.value ?
                                  CustomDropdown(
                                    label: "dialeal'",
                                    items: [],
                                    // Pass your list of items
                                    value: controller.dialect.value,
                                    // Selected value
                                    onChanged: ((newValue) =>
                                        controller
                                            .afterOnchangeDropdownForDialeal(
                                            newValue)),
                                  )
                                  // _dialbuildDropdown(
                                  //   'dialeal',
                                  //
                                  //   [],
                                  // ) // ✅ Show loader while data is loading
                                      :
                                  CustomDropdown(
                                    label: "dialeal'",
                                    items: controller.dial.value.data,
                                    // Pass your list of items
                                    value: controller.dialect.value,
                                    // Selected value
                                    onChanged: ((newValue) =>
                                        controller
                                            .afterOnchangeDropdownForDialeal(
                                            newValue)),
                                  )
          
                                    // _dialbuildDropdown(
                                    //   'dialeal',
                                    //
                                    //   controller.dial.value.data ?? [],
                                    // ),
                                  )
          
          
                              ),
          
          
                              // dialeal end
          
          
                            ],
                          ),
          
                      ),
          
          
                      // Obx(() =>
                      //     CustomDropdown(
                      //       label: "District",
                      //       items: controller.dis.value.data,
                      //       // Pass your list of items
                      //       value: controller.district.value,
                      //       // Selected value
                      //       onChanged: ((newValue) =>
                      //           controller.afterOnchangeDropdownForDivision(
                      //               newValue)),
                      //     )
                      // ),
          
          
                      SizedBox(width: 10),
                      _buildTextField(
                          'Referral Code (if any)', controller.referralCode,
                          required: false),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (controller.formKey.currentState!.validate()) {
                                  controller.sign_Up();
          
                                } else {
                                  print("Form is invalid!");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal),
                              child: Text(
                                  'Sign Up', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "have an account? ",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.blueGrey,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login now",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal, // Make it look like a link
                                    decoration: TextDecoration.underline, // Underline for better visibility
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Replace with your Signup screen
                                      Get.offNamed(Routes.LOGIN);
          
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
          
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
















//
//   Widget _dialbuildDropdown(String label, List<Data>? items) {
//     return DropdownButtonFormField<String>(
//
//       value: controller.dialect.value.isEmpty ? null : controller.dialect.value,
//       decoration: InputDecoration(
//           labelText: label, border: OutlineInputBorder()),
//       items: items?.map((item) =>
//           DropdownMenuItem(
//             value: item.label, // Extract label
//             child: Text(item.label ?? ''),
//           )).toList() ?? [],
//       onChanged: (newValue) {
//         controller.dialect.value = newValue!;
//         print(controller.dialect.value);
//
//
//         Data? selectedData = controller.dial.value.data?.firstWhere(
//               (item) => item.label == controller.dialect.value,
//           orElse: () => Data(label: '', value: null), // Default if not found
//         );
//         int? x = selectedData?.value?.toInt();
//         print(x);
//
//         if (x != null) {
//           controller.dialect_id.value = x.toString();
//         }
//       },
//       validator: (value) => value == null ? 'Please select $label' : null,
//     )
//     ;
//   }
// }





//   Widget _buildDropdown(String label, RxString value, List<Data>? items) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8.0),
//       child: Obx(() => DropdownButtonFormField<String>(
//         value: value.value.isEmpty ? null : value.value,
//         decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
//         items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
//         onChanged: (newValue) => value.value = newValue!,
//         validator: (value) => value == null ? 'Please select $label' : null,
//       )),
//     );
//   }
// }


  // Widget _buildDropdown(String label, List<Data>? items) {
  //
  //
  //
  //   return
  //       DropdownButtonFormField<String>(
  //
  //         value: controller.division.value.isEmpty ? null : controller.division.value,
  //         decoration: InputDecoration(
  //             labelText: label, border: OutlineInputBorder()),
  //         items:  items?.map((item) =>
  //             DropdownMenuItem(
  //               value: item.label, // Extract label
  //               child: Text(item.label ?? '',
  //                 overflow: TextOverflow.ellipsis,),
  //             )).toList() ?? [],
  //         onChanged: (newValue) {controller.division.value = newValue!;
  //           print(controller.division.value );
  //
  //         controller.district.value = '';
  //         controller.upazila.value = '';
  //         controller.dialect.value = '';
  //         controller.dis.value = Division();  // Reset District list
  //         controller.upodis.value = Division();  // Reset Upazila list
  //         controller.dial.value = Division();
  //
  //         Data? selectedData = controller.div.value.data?.firstWhere(
  //               (item) => item.label == controller.division.value,
  //           orElse: () => Data(label: '', value: null), // Default if not found
  //         );
  //         int? x=selectedData?.value?.toInt();
  //         if(x!=null){
  //           controller.division_id.value=x.toString();
  //           controller.load_dis(x);
  //
  //         }
  //
  //
  //
  //           },
  //         validator: (value) => value == null ? 'Please select $label' : null,
  //       );
  // }


  // Widget _disbuildDropdown(String label, List<Data>? items) {
  //
  //
  //
  //   return
  //       DropdownButtonFormField<String>(
  //         iconSize: 10,
  //
  //         value: controller.district.isEmpty ? null : controller.district.value,
  //         decoration: InputDecoration(
  //             labelText: label, border: OutlineInputBorder()),
  //         icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.orange, size: 30),
  //
  //         items:  items?.map((item) =>
  //             DropdownMenuItem(
  //               value: item.label, // Extract label
  //
  //               child: Text(item.label ?? '',
  //               overflow: TextOverflow.ellipsis,),
  //             )).toList() ?? [],
  //         onChanged: (newValue) {
  //
  //           controller.district.value = newValue!;
  //         print(controller.district.value );
  //
  //           controller.upazila.value = '';
  //           controller.dialect.value = '';
  //
  //           controller.upodis.value = Division();  // Reset Upazila list
  //           controller.dial.value = Division();
  //
  //           Data? selectedData = controller.dis.value.data?.firstWhere(
  //                 (item) => item.label == controller.district.value,
  //             orElse: () => Data(label: '', value: null), // Default if not found
  //           );
  //           int? x=selectedData?.value?.toInt();
  //           print(x);
  //
  //           if(x!=null){
  //             controller.district_id.value=x.toString();
  //             controller.load_upodis(x);
  //
  //           }
  //           },
  //         validator: (value) => value == null ? 'Please select $label' : null,
  //       );
  //
  // }



  // Widget _disbuildDropdown(String label, List<Data>? items) {
  //   return DropdownButtonFormField<String>(
  //     value: controller.district.isEmpty ? null : controller.district.value,
  //     decoration: InputDecoration(
  //       labelText: label,
  //       labelStyle: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold), // Label color
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10), // Rounded borders
  //         borderSide: BorderSide(color: Colors.blue, width: 2), // Border color and width
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide(color: Colors.grey, width: 1.5),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide(color: Colors.blue, width: 2),
  //       ),
  //       contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16), // Padding inside the dropdown
  //     ),
  //     icon: Icon(Icons.arrow_drop_down_circle_outlined, color: Colors.orange, size: 30), // Custom dropdown icon
  //     dropdownColor: Colors.white, // Background color of dropdown menu
  //     style: TextStyle(color: Colors.black, fontSize: 16), // Text style inside dropdown
  //     isExpanded: true, // Make sure it takes the full width
  //     items: items?.map((item) {
  //       return DropdownMenuItem(
  //         value: item.label, // Extract label
  //         child: Text(
  //           item.label ?? '',
  //           overflow: TextOverflow.ellipsis,
  //           style: TextStyle(color: Colors.black, fontSize: 14), // Dropdown item text style
  //         ),
  //       );
  //     }).toList() ?? [],
  //     onChanged: (newValue) {
  //       controller.district.value = newValue!;
  //       print(controller.district.value);
  //
  //       controller.upazila.value = '';
  //       controller.dialect.value = '';
  //
  //       controller.upodis.value = Division();  // Reset Upazila list
  //       controller.dial.value = Division();
  //
  //       Data? selectedData = controller.dis.value.data?.firstWhere(
  //             (item) => item.label == controller.district.value,
  //         orElse: () => Data(label: '', value: null), // Default if not found
  //       );
  //
  //       int? x = selectedData?.value?.toInt();
  //       print(x);
  //
  //       if (x != null) {
  //         controller.district_id.value = x.toString();
  //         controller.load_upodis(x);
  //       }
  //     },
  //     validator: (value) => value == null ? 'Please select $label' : null,
  //   );
  // }
  //
  //
  //
  // Widget _upazilabuildDropdown(String label, List<Data>? items) {
  //   return
  //       DropdownButtonFormField<String>(
  //
  //         value: controller.upazila.isEmpty ? null : controller.upazila.value,
  //         decoration: InputDecoration(
  //             labelText: label, border: OutlineInputBorder()),
  //         items:  items?.map((item) =>
  //             DropdownMenuItem(
  //               value: item.label, // Extract label
  //               child: Text(item.label ?? '',
  //                 overflow: TextOverflow.ellipsis,),
  //             )).toList() ?? [],
  //         onChanged: (newValue) {controller.upazila.value = newValue!;
  //         print(controller.upazila.value );
  //
  //         controller.dialect.value = '';
  //         controller.dial.value = Division();
  //
  //         Data? selectedData = controller.upodis.value.data?.firstWhere(
  //               (item) => item.label == controller.upazila.value,
  //           orElse: () => Data(label: '', value: null), // Default if not found
  //         );
  //         int? x=selectedData?.value?.toInt();
  //         print(x);
  //
  //         if(x!=null){
  //           controller.upazila_id.value=x.toString();
  //           controller.load_dial(x);
  //
  //
  //         }
  //
  //         },
  //         validator: (value) => value == null ? 'Please select $label' : null,
  //       );
  // }






/*

Row(
                      children: [
                        Expanded(
                          child: Obx(() {
                            if (controller.isloading.value) {
                              return Center(child: CircularProgressIndicator()); // ✅ Show loader while data is loading
                            }
                            return _buildDropdown(
                              'Division',

                              controller.div.value.data ?? [],
                            );
                          }),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Obx(() {
                            if (controller.isdisloading.value) {
                              return _disbuildDropdown(
                                'Distict',

                                [],
                              );// ✅ Show loader while data is loading
                            }
                            return _disbuildDropdown(
                              'Distict',

                              controller.dis.value.data ?? [],
                            );
                          }),
                        ),
                      ],
                    ),

*/

