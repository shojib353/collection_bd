import 'package:bd_collection/app/modules/profile/providers/profile_provider.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );

    Get.lazyPut<ProfileProvider>(
          () => ProfileProvider(),
    );

  }
}
