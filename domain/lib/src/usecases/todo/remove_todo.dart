import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class RemoveTodo extends UseCase<bool, ParamRemoveTodo> {
  RemoveTodo(this.todoRepository);

  TodoRepository todoRepository;

  @override
  Future<Either<Failure, bool>> call(ParamRemoveTodo params) {
    return todoRepository.removeTodoBy(params.id);
  }
}

class ParamRemoveTodo extends Equatable {
  ParamRemoveTodo(this.id);

  final int id;

  @override
  List<Object> get props => [];
}
