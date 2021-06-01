import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class GetTodoList extends UseCase<List<Todo>, NoParams> {
  GetTodoList(this.localTodoRepository);

  final TodoRepository localTodoRepository;

  @override
  Future<Either<Failure, List<Todo>>> call(NoParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return localTodoRepository.getTodoList();
  }
}
