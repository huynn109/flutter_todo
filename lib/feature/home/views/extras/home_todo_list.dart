import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/feature/home/controllers/home_controller.dart';
import 'package:flutter_todo_simple/feature/home/views/extras/home_todo_item.dart';
import 'package:flutter_todo_simple/widget/empty_view.dart';
import 'package:get/get.dart';

class HomeTodoList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.viewState.value) {
        case ViewState.initial:
          break;
        case ViewState.busy:
          break;
        case ViewState.error:
          break;
        case ViewState.empty:
          return EmptyView();
        case ViewState.data:
          return HomeTodoDataList();
      }

      return Container();
    });
  }
}

class HomeTodoDataList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.todoList.length,
      itemBuilder: (context, index) {
        var todoItem = controller.todoList.elementAt(index);

        return HomeTodoItem(
          todoItem: todoItem,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 4);
      },
    );
  }
}
