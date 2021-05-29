import 'package:flutter_todo_simple/app/core/utils/uuid_utils.dart';
import 'package:flutter_todo_simple/data/data.dart';

class Todo {
  String id;
  String? text;
  CategoryModel? category;
  String? date;
  String? time;
  bool completed;

  Todo({
    this.text,
    this.category,
    this.date,
    this.time,
    this.completed = false,
  }) : id = Uuid().generateV4();

  factory Todo.empty() {
    return Todo(
      text: '',
      category: null,
      date: null,
      completed: false,
    );
  }

  Todo copyWith({
    String? text,
    CategoryModel? category,
    String? date,
    bool? completed,
  }) {
    return Todo(
      text: text ?? this.text,
      category: category ?? this.category,
      date: date ?? this.date,
      time: time ?? this.time,
      completed: completed ?? this.completed,
    );
  }
}
