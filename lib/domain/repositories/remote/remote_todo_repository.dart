import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/domain/domain.dart';

abstract class RemoteTodoRepository {
  Future<Either<Failure, List<Todo>>> getRemoteTodoList();
}
