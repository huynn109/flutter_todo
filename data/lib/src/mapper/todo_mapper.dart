import 'package:data/data.dart';
import 'package:domain/domain.dart';

class TodoMapper implements Mapper<Todo, TodoModel> {
  @override
  TodoModel fromEntity(Todo from) {
    return TodoModel(id: from.id);
  }

  @override
  Todo toEntity(TodoModel from) {
    return Todo();
  }
}
