import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/errors/failure.dart';
import 'package:flutter_todo_simple/data/data.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoRepositoryImpl(
      {required this.apiTodoProvider, required this.localTodoProvider});

  final IApiTodoProvider apiTodoProvider;
  final ILocalTodoProvider localTodoProvider;

  @override
  Future<Either<Failure, List<Todo>>> getLocalTodoList() {
    return localTodoProvider.getTodoList();
  }

  @override
  Future<Either<Failure, List<Todo>>> getRemoteTodoList() {
    return apiTodoProvider.getTodoList();
  }
}
