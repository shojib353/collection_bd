
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/registration_controller.dart';
import '../model/divition.dart';


class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                _buildTextField('Name', controller.name, validator: (value) {
                  if (value!.isEmpty) return 'Name is required';
                  return null;
                }),
                _buildTextField('Mobile', controller.mobile,
                    keyboardType: TextInputType.phone, validator: (value) {
                      if (value!.isEmpty) return 'Mobile number is required';
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
                _buildTextField('Confirm Password', controller.confirmPassword,
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

                Obx(()=>
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Expanded(
                      flex: 1,
                      child:
                        controller.isupodisloading.value ?
                           _upazilabuildDropdown(
                            'Upazila/Thana',

                            [],
                          ):

                         _upazilabuildDropdown(
                          'Upazila/Thana',

                          controller.upodis.value.data ?? [],
                        )


                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Obx(()=>controller.isdialloading.value ?
                           _dialbuildDropdown(
                            'dialeal',

                            [],
                          )// ✅ Show loader while data is loading
                        :
                         _dialbuildDropdown(
                          'dialeal',

                          controller.dial.value.data ?? [],
                        ),
                      )


                    ),
                  ],
                ),),
                SizedBox(width: 10),
                _buildTextField(
                    'Referral Code (if any)', controller.referralCode,
                    required: false),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.sign_Up();



                    } else {
                      print("Form is invalid!");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange),
                  child: Text('Sign Up', style: TextStyle(color: Colors.white)),
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
            labelText: label, border: OutlineInputBorder()),
      ),
    );
  }

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


  Widget _buildDropdown(String label, List<Data>? items) {



    return
        DropdownButtonFormField<String>(

          value: controller.division.value.isEmpty ? null : controller.division.value,
          decoration: InputDecoration(
              labelText: label, border: OutlineInputBorder()),
          items:  items?.map((item) =>
              DropdownMenuItem(
                value: item.label, // Extract label
                child: Text(item.label ?? '',
                  overflow: TextOverflow.ellipsis,),
              )).toList() ?? [],
          onChanged: (newValue) {controller.division.value = newValue!;
            print(controller.division.value );

          controller.district.value = '';
          controller.upazila.value = '';
          controller.dialect.value = '';
          controller.dis.value = Division();  // Reset District list
          controller.upodis.value = Division();  // Reset Upazila list
          controller.dial.value = Division();

          Data? selectedData = controller.div.value.data?.firstWhere(
                (item) => item.label == controller.division.value,
            orElse: () => Data(label: '', value: null), // Default if not found
          );
          int? x=selectedData?.value?.toInt();
          if(x!=null){
            controller.division_id.value=x.toString();
            controller.load_dis(x);

          }



            },
          validator: (value) => value == null ? 'Please select $label' : null,
        );
  }


  Widget _disbuildDropdown(String label, List<Data>? items) {



    return
        DropdownButtonFormField<String>(

          value: controller.district.isEmpty ? null : controller.district.value,
          decoration: InputDecoration(
              labelText: label, border: OutlineInputBorder()),
          items:  items?.map((item) =>
              DropdownMenuItem(
                value: item.label, // Extract label

                child: Text(item.label ?? '',
                overflow: TextOverflow.ellipsis,),
              )).toList() ?? [],
          onChanged: (newValue) {

            controller.district.value = newValue!;
          print(controller.district.value );

            controller.upazila.value = '';
            controller.dialect.value = '';

            controller.upodis.value = Division();  // Reset Upazila list
            controller.dial.value = Division();

            Data? selectedData = controller.dis.value.data?.firstWhere(
                  (item) => item.label == controller.district.value,
              orElse: () => Data(label: '', value: null), // Default if not found
            );
            int? x=selectedData?.value?.toInt();
            print(x);

            if(x!=null){
              controller.district_id.value=x.toString();
              controller.load_upodis(x);

            }
            },
          validator: (value) => value == null ? 'Please select $label' : null,
        );

  }


  Widget _upazilabuildDropdown(String label, List<Data>? items) {
    return
        DropdownButtonFormField<String>(

          value: controller.upazila.isEmpty ? null : controller.upazila.value,
          decoration: InputDecoration(
              labelText: label, border: OutlineInputBorder()),
          items:  items?.map((item) =>
              DropdownMenuItem(
                value: item.label, // Extract label
                child: Text(item.label ?? '',
                  overflow: TextOverflow.ellipsis,),
              )).toList() ?? [],
          onChanged: (newValue) {controller.upazila.value = newValue!;
          print(controller.upazila.value );

          controller.dialect.value = '';
          controller.dial.value = Division();

          Data? selectedData = controller.upodis.value.data?.firstWhere(
                (item) => item.label == controller.upazila.value,
            orElse: () => Data(label: '', value: null), // Default if not found
          );
          int? x=selectedData?.value?.toInt();
          print(x);

          if(x!=null){
            controller.upazila_id.value=x.toString();
            controller.load_dial(x);


          }

          },
          validator: (value) => value == null ? 'Please select $label' : null,
        )
    ;
  }

  Widget _dialbuildDropdown(String label, List<Data>? items) {
    return DropdownButtonFormField<String>(

          value: controller.dialect.value.isEmpty ? null : controller.dialect.value,
          decoration: InputDecoration(
              labelText: label, border: OutlineInputBorder()),
          items:  items?.map((item) =>
              DropdownMenuItem(
                value: item.label, // Extract label
                child: Text(item.label ?? ''),
              )).toList() ?? [],
          onChanged: (newValue) {controller.dialect.value = newValue!;
          print(controller.dialect.value );


          Data? selectedData = controller.dial.value.data?.firstWhere(
                (item) => item.label == controller.dialect.value,
            orElse: () => Data(label: '', value: null), // Default if not found
          );
          int? x=selectedData?.value?.toInt();
          print(x);

          if(x!=null){
            controller.dialect_id.value=x.toString();


          }





          },
          validator: (value) => value == null ? 'Please select $label' : null,
        )
    ;
  }


}













