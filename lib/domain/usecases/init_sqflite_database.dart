import 'package:dartz/dartz.dart';
import 'package:flutter_todo_simple/app/core/core.dart';
import 'package:flutter_todo_simple/domain/repositories/database_repository.dart';

class InitSqfLiteDatabase extends UseCase<bool, NoParams> {
  DatabaseRepository databaseRepository;

  InitSqfLiteDatabase(this.databaseRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return databaseRepository.initDatabase();
  }
}
