import 'package:flutter_todo_simple/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final to = Get.find<ProfileController>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
  void gotoHome() => Get.to(Routes.HOME);
}
