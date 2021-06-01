import 'package:core/src/result/failure.dart';
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

  final String id;

  @override
  List<Object> get props => [];
}
