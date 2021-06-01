import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class InsertTodo extends UseCase<String, Todo> {
  InsertTodo(this.localTodoRepository);

  TodoRepository localTodoRepository;

  @override
  Future<Either<Failure, String>> call(Todo params) {
    return localTodoRepository.insertTodo(params);
  }
}
