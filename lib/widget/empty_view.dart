import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_todo_simple/resources/resource.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({
    Key? key,
    this.title = "No data",
    this.content = "Please add new todo",
    this.isExpanded = false,
  }) : super(key: key);

  final String title;
  final String content;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = buildBodyEmptyWidgetWith(
      context,
      title,
      content,
    );
    if (isExpanded) {
      return Expanded(
        child: contentWidget,
      );
    }

    return contentWidget;
  }

  Widget buildBodyEmptyWidgetWith(
    BuildContext context,
    String title,
    String textContent,
  ) {
    return Container(
      color: const Color(
        COLOUR_GREY_LIGHT,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              content,
            ),
          ],
        ),
      ),
    );
  }
}
