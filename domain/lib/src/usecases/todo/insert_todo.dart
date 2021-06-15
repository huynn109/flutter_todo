import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class InsertTodo extends UseCase<int, ParamAddTodo> {
  InsertTodo(this.localTodoRepository);

  TodoRepository localTodoRepository;

  @override
  Future<Either<Failure, int>> call(ParamAddTodo params) {
    return localTodoRepository.insertTodo(params.todo);
  }
}

class ParamAddTodo extends Equatable {
  ParamAddTodo(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [];
}
