import 'package:get/get.dart';

class GlobalController extends GetxController {
  static GlobalController get instance => Get.find<GlobalController>();

  final isLoading = false.obs;
  void setLoading(bool value) {
    isLoading.value = value;
  }
}
