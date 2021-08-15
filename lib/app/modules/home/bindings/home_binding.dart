import 'package:get/get.dart';

import 'package:alarm/app/modules/home/controllers/ads_controller.dart';
import 'package:alarm/app/modules/home/controllers/storage_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdsController>(
      () => AdsController(),
    );
    Get.lazyPut<StorageController>(
      () => StorageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
