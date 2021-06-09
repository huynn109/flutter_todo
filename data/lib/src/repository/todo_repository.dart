import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/src/datasource/todo/local_todo_data_source.dart';
import 'package:data/src/datasource/todo/remote_todo_data_source.dart';
import 'package:domain/domain.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.localTodo,
    required this.remoteTodo,
  });

  final ILocalTodo localTodo;
  final IRemoteTodo remoteTodo;

  @override
  Future<Either<Failure, List<Todo>>> getTodoList() {
    return localTodo.getTodoList();
  }

  @override
  Future<Either<Failure, int>> insertTodo(Todo todo) {
    return localTodo.insertTodo(todo);
  }

  @override
  Future<Either<Failure, bool>> removeTodoList() {
    return localTodo.removeTodoList();
  }

  @override
  Future<Either<Failure, bool>> removeTodoBy(int id) {
    return localTodo.removeTodoBy(id);
  }
}
