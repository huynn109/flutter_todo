import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/app/resources/resource.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_category_list.dart';

class HomeCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Categories".toUpperCase(),
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: const Color(COLOUR_GREY),
                ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 110,
          child: HomeCategoryList(),
        ),
      ],
    );
  }
}
