import 'package:get/get.dart';

import 'package:alarm/app/modules/home/controllers/storage_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageController>(
      () => StorageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
