import 'package:flutter_todo_simple/feature/home/bindings/home_binding.dart';
import 'package:flutter_todo_simple/feature/home/views/home_view.dart';
import 'package:flutter_todo_simple/feature/profile/views/profile_view.dart';
import 'package:flutter_todo_simple/feature/splash/bindings/splash_binding.dart';
import 'package:flutter_todo_simple/feature/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.PRESENTATION + _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRESENTATION + _Paths.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.PRESENTATION + _Paths.SPLASH_SCREEN,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
