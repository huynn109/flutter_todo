import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/app/resources/resource.dart';
import 'package:flutter_todo_simple/presentation/home/controllers/home_controller.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_todo_list.dart';
import 'package:get/get.dart';

class HomeTodoView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Text(
              "Today's task".toUpperCase(),
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: const Color(COLOUR_GREY),
                  ),
            ),
          ),
          HomeTodoList(),
        ],
      ),
    );
  }
}
