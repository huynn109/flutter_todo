import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

class TodoMapperImpl implements TodoMapper<Todo, TodoModel> {
  @override
  TodoModel fromEntity(Todo from) {
    return TodoModel(
      text: from.text,
      completed: from.completed,
      time: from.time,
      date: from.date,
      category: from.category,
    );
  }

  @override
  Todo toEntity(TodoModel from) {
    return Todo(
      text: from.text,
      completed: from.completed,
      time: from.time,
      date: from.date,
      category: from.category,
    );
  }
}
