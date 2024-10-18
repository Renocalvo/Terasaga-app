import 'package:get/get.dart';

import '../controllers/baca_controller.dart';

class bacaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<bacaController>(
      () => bacaController(),
    );
  }
}
