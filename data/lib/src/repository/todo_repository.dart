import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:data/src/datasource/todo/local_todo_data_source.dart';
import 'package:data/src/datasource/todo/remote_todo_data_source.dart';
import 'package:domain/domain.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl({
    required this.localTodo,
    required this.remoteTodo,
    required this.todoMapper,
  });

  final ILocalTodo localTodo;
  final IRemoteTodo remoteTodo;
  final TodoMapper todoMapper;

  @override
  Future<Either<Failure, List<Todo>>> getTodoList() {
    return localTodo.getTodoList();
  }

  @override
  Future<Either<Failure, int>> insertTodo(Todo todo) {
    return localTodo.insertTodo(todoMapper.fromEntity(todo));
  }

  @override
  Future<Either<Failure, bool>> removeTodoList() {
    return localTodo.removeTodoList();
  }

  @override
  Future<Either<Failure, bool>> removeTodoBy(int id) {
    return localTodo.removeTodoBy(id);
  }

  @override
  Future<Either<Failure, bool>> updateTodo(Todo todo) {
    return localTodo.updateTodo(todoMapper.fromEntity(todo));
  }
}
