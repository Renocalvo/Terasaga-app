import 'package:get/get.dart';

import '../controllers/edit_postingan_controller.dart';

class editPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<editPostController>(
      () => editPostController(),
    );
  }
}
