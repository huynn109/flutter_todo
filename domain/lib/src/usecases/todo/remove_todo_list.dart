import 'package:core/src/result/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';

class RemoveTodoList extends UseCase<bool, NoParams> {
  RemoveTodoList(this.todoRepository);
  TodoRepository todoRepository;
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return todoRepository.removeTodoList();
  }
}
