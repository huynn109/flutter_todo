import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/app/core/widget/empty_view.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/presentation/home/controllers/home_controller.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_todo_item.dart';
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
          return EmptyView(
            isExpanded: true,
          );
        case ViewState.data:
          return HomeTodoDataList(
            todoList: controller.todoList.cast(),
          );
      }
      return Container();
    });
  }
}

class HomeTodoDataList extends StatelessWidget {
  final List<Todo> todoList;

  HomeTodoDataList({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        var todoItem = todoList.elementAt(index);
        return HomeTodoItem(todoItem);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 4);
      },
    );
  }
}
