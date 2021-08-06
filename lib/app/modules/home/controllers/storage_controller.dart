import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageController extends GetxController {
  final box = GetStorage();

  saveData(key, value) {
    return box.write(key, value);
  }

  getData(key) {
    return box.read(key);
  }
}
