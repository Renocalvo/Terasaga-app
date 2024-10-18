import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class profileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<profileController>(
      () => profileController(),
    );
  }
}
