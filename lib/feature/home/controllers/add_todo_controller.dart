import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/di/injector.dart';
import 'package:flutter_todo_simple/feature/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  final _homeController = Get.find<HomeController>();
  GlobalKey addTodoFormKey = GlobalKey<FormState>();
  final TextEditingController inputTodoController = TextEditingController();
  final insertTodoUseCase = Injector.resolve<InsertTodo>();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveTodo() async =>
      handleResultSaveTodo(await insertTodoUseCase.call(Todo(text: "Test")));

  void handleResultSaveTodo(Either<Failure, String> resultSaveTodo) {
    resultSaveTodo.fold(
      (l) => Logger.write(l.message),
      (r) {
        _homeController.loadTodoList();
      },
    );
  }
}
