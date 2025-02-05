import 'package:get/get.dart';

import '../../registration/controllers/registration_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  final RegistrationController registerController = Get.find<RegistrationController>();

  final count = 0.obs;
  final RxString tokx = 'token is:'.obs;

  @override
  void onInit() {
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


}
