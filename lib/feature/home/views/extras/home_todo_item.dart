import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/resources/resource.dart';
import 'package:flutter_todo_simple/widget/todo_circle_checkbox.dart';

class HomeTodoItem extends StatelessWidget {
  HomeTodoItem({
    Key? key,
    required this.todoItem,
  }) : super(key: key);

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
                isChecked: false,
                borderColor: Colors.green,
                checkedColor: const Color(COLOUR_GREY_DARK_100),
                onChange: (valueChange) {
                  Logger.write(valueChange.toString());
                },
              ),
            ),
            Expanded(
              child: Text(
                todoItem.text ?? '',
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      // decoration: false ? TextDecoration.lineThrough : null,
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
