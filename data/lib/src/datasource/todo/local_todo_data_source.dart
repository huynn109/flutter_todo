import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ILocalTodo {
  Future<Either<Failure, List<Todo>>> getTodoList();

  Future<Either<Failure, String>> insertTodo(Todo todo);

  Future<Either<Failure, bool>> removeTodoList();
  Future<Either<Failure, bool>> removeTodoBy(String id);
}

class LocalTodoDataSource implements ILocalTodo {
  final TodoDatabase todoDatabase;

  LocalTodoDataSource({
    required this.todoDatabase,
  });

  @override
  Future<Either<Failure, List<Todo>>> getTodoList() async {
    return await todoDatabase.getTodoList();
  }

  @override
  Future<Either<Failure, String>> insertTodo(Todo todo) async {
    return await todoDatabase.insertTodo(todo);
  }

  @override
  Future<Either<Failure, bool>> removeTodoList() async {
    return Right(await todoDatabase.removeAllTodoList());
  }

  @override
  Future<Either<Failure, bool>> removeTodoBy(String id) async {
    return await todoDatabase.removeTodoBy(id);
  }
}
