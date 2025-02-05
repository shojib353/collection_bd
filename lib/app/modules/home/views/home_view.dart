import 'package:bd_collection/app/modules/registration/controllers/registration_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {


  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child:Obx(()=>  Text(
          controller.tokx.value.toString(),
          style: const TextStyle(fontSize: 20),
        ),)
      ),
    );
  }
}
