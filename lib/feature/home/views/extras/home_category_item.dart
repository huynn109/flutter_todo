import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/resources/resource.dart';

class HomeCategoryItem extends StatelessWidget {
  final Category? categoryItem;

  HomeCategoryItem({this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color(COLOUR_GREY_DARK),
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextNumberOfTask(context),
              SizedBox(height: 4),
              buildTextName(context),
              Spacer(),
              buildIndicatorExpanded(),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildIndicatorExpanded() {
    return Expanded(
      child: Align(
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: 0.7,
              valueColor: new AlwaysStoppedAnimation<Color>(
                Color(categoryItem?.color ?? 0xff00ff00),
              ),
              backgroundColor: const Color(COLOUR_GREY_DARK),
            ),
          ),
        ),
      ),
    );
  }

  Text buildTextName(BuildContext context) {
    return Text(
      categoryItem?.name ?? "",
      style: Theme.of(context).textTheme.headline5,
    );
  }

  Text buildTextNumberOfTask(BuildContext context) {
    return Text(
      "${categoryItem?.todosNumber ?? 0} tasks",
      style: Theme.of(context).textTheme.caption,
    );
  }
}
