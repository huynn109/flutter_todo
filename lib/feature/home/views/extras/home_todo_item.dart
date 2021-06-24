import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/feature/home/controllers/home_controller.dart';
import 'package:flutter_todo_simple/resources/resource.dart';
import 'package:flutter_todo_simple/widget/todo_circle_checkbox.dart';
import 'package:get/get.dart';

class HomeTodoItem extends StatelessWidget {
  HomeTodoItem({
    Key? key,
    required this.todoItem,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();
  final Todo todoItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: roundedRectangleBorder(),
      child: ListTile(
        shape: roundedRectangleBorder(),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: CircularCheckBox(
                isChecked: todoItem.completed,
                borderColor: Colors.green,
                checkedColor: const Color(COLOUR_GREY_DARK_100),
                onChange: (valueChange) =>
                    homeController.completeTodo(todoItem),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Text(
                  todoItem.text ?? '',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        decoration: todoItem.completed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  RoundedRectangleBorder roundedRectangleBorder() {
    return RoundedRectangleBorder(
      side: BorderSide(
        color: const Color(COLOUR_GREY_DARK),
        width: 1,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          15,
        ),
      ),
    );
  }
}
