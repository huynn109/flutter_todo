import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/errors/failure.dart';
import 'package:flutter_todo_simple/data/database/todo_database.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class ILocalTodoProvider {
  Future<Either<Failure, List<Todo>>> getTodoList();
}

class LocalTodoProvider implements ILocalTodoProvider {
  final TodoDatabase todoDatabase;
  final CategoryMapper categoryMapper;

  LocalTodoProvider({
    required this.todoDatabase,
    required this.categoryMapper,
  });

  @override
  Future<Either<Failure, List<Todo>>> getTodoList() async {
    return await todoDatabase.getTodoList();
  }
}
