import 'package:domain/domain.dart';

class Todo {
  String? id;
  String? text;
  Category? category;
  String? date;
  String? time;
  bool completed;

  Todo({
    this.text,
    this.category,
    this.date,
    this.time,
    this.completed = false,
  });

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
    Category? category,
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
