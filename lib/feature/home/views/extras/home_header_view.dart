import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/feature/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HeaderView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "What's up, Huy",
        style: Theme.of(context).textTheme.headline3?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
