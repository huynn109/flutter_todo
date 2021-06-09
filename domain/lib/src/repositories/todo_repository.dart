import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodoList();
  Future<Either<Failure, int>> insertTodo(Todo todo);
  Future<Either<Failure, bool>> removeTodoList();
  Future<Either<Failure, bool>> removeTodoBy(int id);
}
