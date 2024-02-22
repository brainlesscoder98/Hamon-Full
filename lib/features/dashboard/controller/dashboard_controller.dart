import 'package:get/get.dart';

import '../../../main.dart';

class DashboardController extends GetxController {
  var isMenuOpened = false.obs;
  var greetingMessage = "".obs;

  @override
  void onInit() {
    super.onInit();
    updateGreetingMessage();
    storage.write("classroomID","");
    storage.write("subjectID","");
  }

  void toggleMenu() {
    isMenuOpened.value = !isMenuOpened.value;
  }

  void updateGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greetingMessage.value = 'Good morning';
    } else if (hour < 18) {
      greetingMessage.value = 'Good afternoon';
    } else {
      greetingMessage.value = 'Good evening';
    }
  }
}
