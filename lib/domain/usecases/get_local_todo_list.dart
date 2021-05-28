import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';
import 'package:flutter_todo_simple/domain/repositories/local/local_todo_repository.dart';

class GetLocalTodoList extends UseCase<List<Todo>, NoParams> {
  final LocalTodoRepository localTodoRepository;

  GetLocalTodoList(this.localTodoRepository);

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return localTodoRepository.getLocalTodoList();
  }
}
