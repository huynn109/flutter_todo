import 'package:flutter_todo_simple/feature/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(),
    );
  }
}
