import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper extends GetxController {
  static GetStorage box = GetStorage('storagename');


  // ignore: always_declare_return_types, type_annotate_public_apis
  static writeData(String key, dynamic value) async {
    await box.write(key, value);
  }

  static dynamic readData(String key) {
    return box.read(key);
  }

  // ignore: type_annotate_public_apis, always_declare_return_types
  static deleteData(String key) async {
    await box.remove(key);
  }

  // ignore: always_declare_return_types, type_annotate_public_apis
  static eraseData() async {
    await box.erase();
  }
}
