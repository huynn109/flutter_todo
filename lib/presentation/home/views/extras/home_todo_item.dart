import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/resources/resource.dart';

class HomeTodoItem extends StatefulWidget {
  HomeTodoItem(Todo todoItem);

  @override
  _ItemRowState createState() => _ItemRowState();
}

class _ItemRowState extends State<HomeTodoItem> {
  var isChecked = false;
  var shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        15,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: shape,
      child: ListTile(
        shape: shape,
        onTap: () {
          isChecked = !isChecked;
          setState(() {});
        },
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
              ),
              child: CircularCheckBox(
                isChecked: isChecked,
                borderColor: Colors.green,
                checkedColor: const Color(COLOUR_GREY_DARK_100),
                onChange: (valueChange) {
                  Logger.write(valueChange.toString());
                  isChecked = !valueChange;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: Text(
                "Online test interview",
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      decoration: isChecked ? TextDecoration.lineThrough : null,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
