import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TodoMapper implements Mapper<Todo, TodoModel> {
  @override
  TodoModel fromEntity(Todo from) {
    return TodoModel(
      id: from.id,
      text: from.text,
      category: from.category,
      date: from.date,
      time: from.time,
      completed: from.completed,
    );
  }

  @override
  Todo toEntity(TodoModel from) {
    return Todo(
      id: from.id,
      text: from.text,
      category: from.category,
      date: from.date,
      time: from.time,
      completed: from.completed,
    );
  }
}
