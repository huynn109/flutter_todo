import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/app/resources/resource.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

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
              Text(
                "${categoryItem?.todosNumber ?? 0} tasks",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                categoryItem?.name ?? "",
                style: Theme.of(context).textTheme.headline5,
              ),
              Spacer(),
              Expanded(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
