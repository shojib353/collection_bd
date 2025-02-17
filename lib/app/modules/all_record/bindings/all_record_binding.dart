import 'package:bd_collection/app/modules/all_record/providers/all_record_provider.dart';
import 'package:get/get.dart';

import '../controllers/all_record_controller.dart';

class AllRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllRecordController>(
      () => AllRecordController(),
    );
    Get.lazyPut<AllRecordProvider>(
          () => AllRecordProvider(),
    );
  }
}
