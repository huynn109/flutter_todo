import 'package:domain/domain.dart';
import 'package:flutter_todo_simple/di/injector.dart';
import 'package:flutter_todo_simple/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final initDatabase = Injector.resolve<InitDatabase>();
  final insertCategoryList = Injector.resolve<InsertCategoryList>();

  @override
  Future<void> onInit() async {
    super.onInit();
    await _initDatabase();
    await _insertCategoryTable();
    gotoHome();
  }

  Future<void> _initDatabase() async {
    await Future.delayed(const Duration(seconds: 1));
    await initDatabase.call(NoParams());
  }

  Future<void> _insertCategoryTable() async {
    await insertCategoryList.call(insertCategoryList.fakeDataCategory());
  }

  void gotoHome() => Get.offAndToNamed(Routes.HOME);
}
