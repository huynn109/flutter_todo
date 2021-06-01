import 'package:flutter_todo_simple/feature/home/controllers/add_todo_controller.dart';
import 'package:flutter_todo_simple/feature/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
  }
}
