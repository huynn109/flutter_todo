import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/core.dart';

abstract class DatabaseRepository {
  Future<Either<Failure, bool>> initDatabase();
}
