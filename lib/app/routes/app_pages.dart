import 'package:flutter_todo_simple/presentation/home/bindings/home_binding.dart';
import 'package:flutter_todo_simple/presentation/home/views/home_view.dart';
import 'package:flutter_todo_simple/presentation/profile/bindings/profile_binding.dart';
import 'package:flutter_todo_simple/presentation/profile/views/profile_view.dart';
import 'package:flutter_todo_simple/presentation/splash/bindings/splash_binding.dart';
import 'package:flutter_todo_simple/presentation/splash/views/splash_view.dart';
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
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRESENTATION + _Paths.SPLASH_SCREEN,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}