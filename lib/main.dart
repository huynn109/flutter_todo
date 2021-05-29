import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/app/di/injector.dart';
import 'package:flutter_todo_simple/app/resources/resource.dart';
import 'package:flutter_todo_simple/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  Injector.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      enableLog: true,
      logWriterCallback: Logger.write,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(COLOUR_GREY_LIGHT),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
