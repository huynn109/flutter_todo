import 'package:flutter/material.dart';

class Category {
  final String? name;
  final int? color;
  int? todosNumber;
  final int? icon;

  Category({this.name, this.todosNumber = 0, this.color, this.icon});
}

class Categories {
  final List<Category> categories;

  Categories(this.categories);

  factory Categories.initial() {
    return Categories(
      <Category>[
        Category(
          name: 'College',
          color: Colors.red.value,
          icon: Icons.school.codePoint,
        ),
        Category(
          name: 'Work',
          color: Colors.blue.value,
          icon: Icons.work.codePoint,
        ),
        Category(
          name: 'Study',
          color: Colors.yellow.value,
          icon: Icons.chrome_reader_mode.codePoint,
        ),
        Category(
          name: 'Sport',
          color: Colors.green.value,
          icon: Icons.sports_soccer.codePoint,
        ),
      ],
    );
  }
}
