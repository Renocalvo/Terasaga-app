import 'package:get/get.dart';

import '../controllers/new_bab_controller.dart';

class newBabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<newBabController>(
      () => newBabController(),
    );
  }
}
