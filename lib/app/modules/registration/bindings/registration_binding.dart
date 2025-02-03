import 'package:bd_collection/app/modules/registration/providers/user_provider.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationController>(
      () => RegistrationController(),
    );
    Get.lazyPut<UserProvider>(
          () => UserProvider(),
    );
  }
}
