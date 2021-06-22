import 'package:core/src/result/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class UpdateTodo extends UseCase<bool, ParamUpdateTodo> {
  UpdateTodo(this.localTodoRepository);

  TodoRepository localTodoRepository;

  @override
  Future<Either<Failure, bool>> call(ParamUpdateTodo paramUpdateTodo) {
    return localTodoRepository.updateTodo(paramUpdateTodo.id);
  }
}

class ParamUpdateTodo extends Equatable {
  ParamUpdateTodo(this.id);

  final int id;

  @override
  List<Object> get props => [];
}
