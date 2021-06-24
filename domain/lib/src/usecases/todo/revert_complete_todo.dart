import 'package:core/src/result/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class RevertCompleteTodo extends UseCase<bool, ParamUpdateTodo> {
  RevertCompleteTodo(this.localTodoRepository);

  TodoRepository localTodoRepository;

  @override
  Future<Either<Failure, bool>> call(ParamUpdateTodo paramUpdateTodo) {
    return localTodoRepository.updateTodo(revertComplete(paramUpdateTodo));
  }

  Todo revertComplete(ParamUpdateTodo paramUpdateTodo) {
    return paramUpdateTodo.todo.copyWith(
      completed: !paramUpdateTodo.todo.completed,
    );
  }
}

class ParamUpdateTodo extends Equatable {
  ParamUpdateTodo(this.todo);

  final Todo todo;

  @override
  List<Object> get props => [];
}
