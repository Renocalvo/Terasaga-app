import 'package:get/get.dart';

import '../controllers/new_postingan_controllers.dart';

class newPostinganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<newPostingController>(
      () => newPostingController(),
    );
  }
}
