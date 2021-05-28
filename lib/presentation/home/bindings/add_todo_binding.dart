import 'package:flutter_todo_simple/presentation/home/controllers/add_todo_controller.dart';
import 'package:get/get.dart';

class AddTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(),
    );
  }
}
