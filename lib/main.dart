import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/di/injector.dart';
import 'package:flutter_todo_simple/routes/app_pages.dart';
import 'package:get/get.dart';

import 'resources/color/color_utils.dart';

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
