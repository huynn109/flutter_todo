import 'package:flutter_todo_simple/app/routes/app_pages.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/di/injector.dart';
import 'package:flutter_todo_simple/domain/usecases/init_sqflite_database.dart';
import 'package:flutter_todo_simple/domain/usecases/insert_local_category_list.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final initSqfLiteDatabase = Injector.resolve<InitSqfLiteDatabase>();
  final insertLocalCategoryList = Injector.resolve<InsertLocalCategoryList>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initDatabase();
    await _insertCategoryTable();
    gotoHome();
  }

  Future<void> _initDatabase() async {
    await Future.delayed(const Duration(seconds: 1));
    await initSqfLiteDatabase.call(NoParams());
  }

  Future<void> _insertCategoryTable() async {
    await insertLocalCategoryList
        .call(insertLocalCategoryList.fakeDataCategory());
  }

  void gotoHome() => Get.offAndToNamed(Routes.HOME);
}
