import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';

abstract class ILocalTodo {
  Future<Either<Failure, List<Todo>>> getTodoList();

  Future<Either<Failure, int>> insertTodo(TodoModel todo);

  Future<Either<Failure, bool>> removeTodoList();

  Future<Either<Failure, bool>> removeTodoBy(int id);

  Future<Either<Failure, bool>> updateTodo(TodoModel todo);
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
  Future<Either<Failure, int>> insertTodo(TodoModel todo) async {
    return await todoDatabase.insertTodo(todo);
  }

  @override
  Future<Either<Failure, bool>> removeTodoList() async {
    return Right(await todoDatabase.removeAllTodoList());
  }

  @override
  Future<Either<Failure, bool>> removeTodoBy(int id) async {
    return await todoDatabase.removeTodoBy(id);
  }

  @override
  Future<Either<Failure, bool>> updateTodo(TodoModel todo) async {
    return await todoDatabase.updateTodo(todo);
  }
}
